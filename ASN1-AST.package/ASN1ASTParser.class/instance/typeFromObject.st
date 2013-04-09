X.680 grammar
typeFromObject
	^ super typeFromObject ==> [:nodes|
		ASN1TypeFromObjectNode new
			object: nodes first;
			field: nodes third ]