visiting
visitIntegerNode: aNode
 	^ ASN1Integer new
		namedNumbers: (self visitAll: aNode namedNumbers)