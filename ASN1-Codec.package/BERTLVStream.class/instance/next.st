accessing
next
	| identifier length clazz |
	identifier := self readIdentifier.
	length := self readLength.
	
	clazz := identifier isConstructed 
		ifTrue: [ ASN1ConstructedTaggedValue ]
		ifFalse: [ ASN1PrimitiveTaggedValue ].

	^ (clazz newFrom: (length hasDefiniteForm 
		ifTrue: [ length readFrom: stream ]
		ifFalse: [ stream ]))
				tag: identifier tag