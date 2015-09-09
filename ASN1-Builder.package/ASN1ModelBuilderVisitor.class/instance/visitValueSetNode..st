visiting
visitValueSetNode: aNode
	^ ASN1SetType new
		elements: (self visit: aNode elementsSpec );
		definingModule: module