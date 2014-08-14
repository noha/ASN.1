accessing
decodedValue: anObject
	^ self newValue: (ASN1PrimitiveCodec decodeBitString: anObject )