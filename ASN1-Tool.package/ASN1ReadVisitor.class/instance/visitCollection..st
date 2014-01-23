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
		[ stream atEnd ifTrue: [ 
			^ self 
				error: (ASN1ElementNotFound new messageText: 'premature end of sequence while looking for tag ', content tag printString)
				on: collection ].
		element := stream next. 
			(element value includesTag: content tag)
				ifTrue: [ true ]
				ifFalse: [
					element value isOptional ifFalse: [ 
						^ self 
							error: (ASN1MandatoryElementNotFound new messageText: 'cannot find element with tag ', content tag printString)
							on: collection ].
					element value hasDefaultValue ifTrue: [  
						collection at: element key put: element value defaultValue ]. 
					false]
		] whileFalse.
		self 
			push: content
			during: [ collection at: element key put:  (self visit: element value) ]].
	^ collection