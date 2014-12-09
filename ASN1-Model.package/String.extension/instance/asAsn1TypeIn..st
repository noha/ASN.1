*asn1-model
asAsn1TypeIn: aContext
	^ (aContext bindingNamed: self) value 
		ifNil: [ NotFound signal: 'cannot find type ', self ]