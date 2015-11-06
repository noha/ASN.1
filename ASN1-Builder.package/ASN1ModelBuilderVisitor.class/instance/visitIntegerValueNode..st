visiting
visitIntegerValueNode: aIntegerValueNode 

	^ ASN1IntegerValue new
		type: ASN1IntegerType new;
		contents: aIntegerValueNode value