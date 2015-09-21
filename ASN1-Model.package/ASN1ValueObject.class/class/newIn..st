instance creation
newIn: aContext

	^ (aContext typeNamed: self asn1TypeName) newValue