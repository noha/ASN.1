creating
newValueForTypeNamed: aString
	^ (self asn1Model typeNamed: aString) newValue