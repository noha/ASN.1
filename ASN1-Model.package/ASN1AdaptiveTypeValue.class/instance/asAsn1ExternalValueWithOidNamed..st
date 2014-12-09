converting
asAsn1ExternalValueWithOidNamed: aString
	^ ASN1ExternalValue new
		value: self; 
		oid: (ASN1CurrentModel value bindingNamed: aString) value