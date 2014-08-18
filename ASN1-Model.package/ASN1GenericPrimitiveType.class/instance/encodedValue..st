codec
encodedValue: anObject
	(type = 'OCTET STRING') ifTrue: [ 
		^ ASN1PrimitiveTaggedValue new 
			contents: (self class encodeOctetString: anObject);
			tag: self universalTag ].
	(type = 'BOOLEAN') ifTrue: [ 
		^ ASN1PrimitiveTaggedValue new 
			contents: (self class encodeBoolean: anObject);
			tag: self universalTag ].
	(type = 'NULL') ifTrue: [ 
		^ ASN1PrimitiveTaggedValue new 
			contents: (self class encodeNull: anObject);
			tag: self universalTag ].
	self halt.