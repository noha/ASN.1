X.680 grammar
typeReference
	^ super typeReference ==> [:node| 
		node asn1Reference ]  