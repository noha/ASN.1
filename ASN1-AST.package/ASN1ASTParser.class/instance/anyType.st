x.680 grammer 1998
anyType
	^ super anyType ==> [:nodes| 
		ASN1AnyTypeNode new
			id: (nodes second 
				ifNotNil: [ nodes second third asn1Reference ]
				ifNil: [ nil ]) ]