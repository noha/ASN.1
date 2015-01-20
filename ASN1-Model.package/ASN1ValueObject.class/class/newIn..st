instance creation
newIn: aContext
	^ self type: (aContext typeNamed: self asn1TypeName) 