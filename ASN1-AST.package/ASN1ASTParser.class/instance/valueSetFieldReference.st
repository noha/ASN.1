X.681 grammar
valueSetFieldReference
	^ super valueSetFieldReference ==> [:node|
		node asn1Reference ]