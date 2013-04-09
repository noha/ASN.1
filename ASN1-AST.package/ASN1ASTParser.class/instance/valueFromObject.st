X.681 grammar
valueFromObject
	^ super valueFromObject ==> [:nodes|
		ASN1ValueFromObjectNode new
			object: nodes first;
			fields: nodes second ]