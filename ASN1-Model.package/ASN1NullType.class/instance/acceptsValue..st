validating
acceptsValue: anObject 
	^ (anObject value asn1TypeClass = self class) and: [ anObject value isNil ]