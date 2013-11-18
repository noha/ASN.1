visiting
visitCollection: aCollection
	| collection  stream |
	collection := ASN1Dictionary new
		type: aCollection.
	stream := aCollection elements readStream.
	stack top do: [:content| | element |
		self flag: #needsRedesign.
		"if skip errors is true we just ignore the part to parse and proceed. This is needed
		if you need to parse as much as possible"
		(content isError & skipErrors) ifTrue: [  ^ collection  ].
		stream atEnd ifTrue: [ Error signal: 'premature end of sequence' ].
		[ element := stream next. 
			(element includesTag: content tag)
				ifTrue: [ true ]
				ifFalse: [
					element isOptional ifFalse: [ 
						skipErrors
							ifTrue: [  ^ collection ]
							ifFalse: [
								ASN1MandatoryElementNotFound signal: 'cannot find element with tag ', content tag printString ]].
					false]
		] whileFalse.
		self 
			push: content
			during: [ collection at: element key put:  (self visit: element value) ]].
	^ collection