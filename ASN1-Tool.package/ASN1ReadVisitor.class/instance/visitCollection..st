visiting
visitCollection: aCollection
	| collection  stream |
	collection := ASN1Dictionary new
		type: aCollection.
	stream := aCollection elements readStream.
	
	"for each decoded value find the type definition"
	stack top do: [:content| | element |
		(content isError & skipErrors) ifTrue: [  ^ collection  ].
		
		"try to find the type for the next tagged value"
		[ element := self nextTagged: content tag on: stream with: collection ]
			on: ASN1MandatoryElementNotFound, ASN1ElementNotFound  
			do: [ :error | 
				skipErrors 
					ifTrue: [  ^ collection ]
					ifFalse: [ error pass ] ].
				
		"add the value to the resulting dictionary"
		element ifNotNil: [  
			self 
				push: content
				during: [ collection at: element key put:  (self visit: element value) ]]].
	
	"if the sequence is longer than the decoded values there could still be mandatory slots
	left that have default values we need to add to the collection"
	[ stream atEnd ] whileFalse: [ 
		self checkOptionalAndDefault: stream next with: collection ] .
	
	^ collection   