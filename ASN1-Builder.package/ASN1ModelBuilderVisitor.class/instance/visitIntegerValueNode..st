visiting
visitIntegerValueNode: aIntegerValueNode 
	"^ ASN1PrimitiveValue new
		type: ASN1IntegerNode;
		value: aIntegerValueNode value"
	^ aIntegerValueNode value