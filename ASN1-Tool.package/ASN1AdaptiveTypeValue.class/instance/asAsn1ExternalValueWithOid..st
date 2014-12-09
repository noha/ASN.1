converting
asAsn1ExternalValueWithOid: anOid
	^ ASN1ExternalValue new
		value: self; 
		oid: anOid