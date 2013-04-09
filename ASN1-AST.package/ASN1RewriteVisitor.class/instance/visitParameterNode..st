visiting
visitParameterNode: aParameterNode 
	^ ASN1Parameter new
		name: aParameterNode reference label;
		type: (self visit: aParameterNode type)