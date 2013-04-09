visiting
visitCollection: aCollection
	| collection  stream |
	collection := ASN1Dictionary new
		type: aCollection.
	stream := aCollection elements readStream.
	stack top do: [:content| | element |
		stream atEnd ifTrue: [ Error signal: 'premature end of sequence' ].
		[ element := stream next. 
			(element includesTag: content tag)
				ifTrue: [ true ]
				ifFalse: [
					element isOptional ifFalse: [ NotFound signal: 'cannot find element with tag' ].
					false]
		] whileFalse.
		self 
			push: content
			during: [ collection at: element key put:  (self visitEncoded: element value) ]].
	^ collection