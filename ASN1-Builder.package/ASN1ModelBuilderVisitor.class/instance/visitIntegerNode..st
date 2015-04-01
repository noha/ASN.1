visiting
visitIntegerNode: aNode
 	^ ASN1IntegerType new
		namedNumbers: (self visitAll: aNode namedNumbers);
		definingModule: module