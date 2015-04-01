visiting
visitValueSetNode: aNode
	^ ASN1Set new
		elements: (self visit: aNode elementsSpec );
		definingModule: module