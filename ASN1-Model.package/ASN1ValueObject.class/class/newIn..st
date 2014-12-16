initailize-release
newIn: aContext
	^ self new
		type: (aContext bindingNamed: self asn1TypeName) value basicType