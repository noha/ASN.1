X.680 grammar
tag
	^ super tag ==> [:nodes| 
		ASN1TagNode new
			encodingReference: nodes second;
			tagClass: nodes third;
			tagNumber: nodes fourth 
		]