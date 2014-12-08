*asn1-tool
asAsn1TypeIn: aContext
	^ (aContext bindingNamed: self) value 
		ifNil: [ NotFound signal: 'cannot find type ', self ]