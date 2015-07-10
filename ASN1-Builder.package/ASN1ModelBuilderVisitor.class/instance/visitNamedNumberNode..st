visiting
visitNamedNumberNode: aNode
	^ ASN1NamedNumber new
		name: aNode name;
		number: aNode number