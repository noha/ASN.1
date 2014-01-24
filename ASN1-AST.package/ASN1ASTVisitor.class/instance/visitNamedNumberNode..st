visiting
visitNamedNumberNode: aNamedNumberNode 
	^ ASN1NamedNumber new
		name: aNamedNumberNode name;
		number: aNamedNumberNode number