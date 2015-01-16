instance creation
newIn: aContext
	^ self type: (aContext bindingNamed: self asn1TypeName) value