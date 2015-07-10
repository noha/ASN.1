accessing
nextTaggedValue
	| identifier length clazz source |
	identifier := self readIdentifier.
	length := self readLength.
	
	clazz := identifier isConstructed 
		ifTrue: [ ASN1ConstructedTaggedValue ]
		ifFalse: [ ASN1PrimitiveTaggedValue ].

	source := length hasDefiniteForm 
		ifTrue: [ | value |
			value := length readFrom: stream.
			value isCollection
				ifTrue: [ value ]
				ifFalse: [ ^ value ] ]
		ifFalse: [  stream  ].
	^ (clazz newFrom: source)
		tag: identifier tag