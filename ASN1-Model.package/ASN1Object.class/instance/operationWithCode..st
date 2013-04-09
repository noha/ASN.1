*asn1-model
operationWithCode: anInteger 
	(self clazz = 'OPERATION' and: [(attributes at: 'operationCode') = anInteger ])
		ifTrue: [ ^ self ]
		ifFalse: [
			attributes do: [:attr|
				(attr operationWithCode: anInteger) ifNotNil: [:op|
					^ op]]]