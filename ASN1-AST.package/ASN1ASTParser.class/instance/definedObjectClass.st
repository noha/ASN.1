X.681 grammar
definedObjectClass
	^ super definedObjectClass ==> [:node|
		node asn1Reference ]