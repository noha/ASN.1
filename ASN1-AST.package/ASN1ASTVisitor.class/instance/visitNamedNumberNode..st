visiting
visitNamedNumberNode: aNamedNumberNode 
	^ ASN1NamedNumberNode new
		name: aNamedNumberNode name;
		number: aNamedNumberNode number