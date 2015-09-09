visiting
visitPrimitiveNode: aNode
	"resolve the name of the node to a implementation class
	of the primitive"
	^ (ASN1PrimitiveType withUniversalType: aNode name) new
		definingModule: module