X.681 grammar
objectClassFieldType
	^ super objectClassFieldType ==> [:nodes| 
		ASN1TypeFieldNode new
			type: nodes first;
			fields: nodes third]