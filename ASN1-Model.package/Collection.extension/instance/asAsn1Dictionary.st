*asn1-model
asAsn1Dictionary
	^ self 
		inject: ASN1Dictionary new
		into: [ :dict :elem |
			dict 
				at: elem key put: elem value;
				yourself ]  