X.681 grammar
objectSetReference
	^ super objectSetReference ==> [:node| 
		node asn1Reference ]