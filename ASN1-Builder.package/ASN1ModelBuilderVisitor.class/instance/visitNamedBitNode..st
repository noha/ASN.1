visiting
visitNamedBitNode: aNamedBitNode 
	^ ASN1NamedValue new
		name: aNamedBitNode name;
		value: aNamedBitNode value asNumber