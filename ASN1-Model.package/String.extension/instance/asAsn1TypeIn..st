*asn1-model
asAsn1TypeIn: aContext
	^ (aContext typeNamed: self) 
		ifNil: [ NotFound signal: 'cannot find type ', self ]