X.680 grammar
typeReferenceToken
	^ super typeReferenceToken ==> [:node| 
		node asn1Reference ] 