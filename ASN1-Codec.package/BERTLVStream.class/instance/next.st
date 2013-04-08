accessing
next
	| identifier length clazz |
	identifier := self readIdentifier.
	length := self readLength.
	
	clazz := identifier isConstructed 
		ifTrue: [ ASN1ConstructedEncoding ]
		ifFalse: [ ASN1PrimitiveEncoding ].

	^ (clazz newFrom: (length hasDefiniteForm 
		ifTrue: [ length readFrom: stream ]
		ifFalse: [ stream ]))
				tag: identifier tag