X.681 grammar
objectClassReference
	^ super objectClassReference ==> [:node| 
		 node asn1Reference ]