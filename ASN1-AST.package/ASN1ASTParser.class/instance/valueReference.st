X.680 grammar
valueReference
	^ super valueReference ==> [:node| 
		node asn1Reference ]