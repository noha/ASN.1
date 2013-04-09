visiting
visitElementsNode: aNode
	^ ASN1Elements new
		elementSpec: (self visit: aNode entity);
		exclusions: (self visitAll: aNode exclusions)
		