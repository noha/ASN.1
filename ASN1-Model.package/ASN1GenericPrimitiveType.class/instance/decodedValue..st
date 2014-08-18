codec
decodedValue: anObject
	(type = 'OCTET STRING') ifTrue: [ 
		^ self class decodeOctetString: anObject ].
	(type = 'BOOLEAN') ifTrue: [ 
		^ self class decodeBoolean: anObject ].
	(type = 'NULL') ifTrue: [ 
		^ self class decodeNull: anObject ].
	self halt.