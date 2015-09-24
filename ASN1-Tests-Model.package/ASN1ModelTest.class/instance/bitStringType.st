as yet unclassified
bitStringType	
	^ ASN1BitStringType new 
		bits: { 
			ASN1NamedValue name: 'one' value: 0 . 
			ASN1NamedValue name: 'two' value: 1 .
			ASN1NamedValue name: 'three' value: 2 .
			ASN1NamedValue name: 'four' value: 3 }