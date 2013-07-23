visiting
visitElementsNode: aNode
	^ ASN1ElementComplement new
		included: (self visit: aNode entity);
		excluded: (self visitAll: aNode exclusions)
		