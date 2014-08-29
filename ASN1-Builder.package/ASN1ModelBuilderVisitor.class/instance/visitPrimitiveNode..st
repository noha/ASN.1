visiting
visitPrimitiveNode: aNode
	"resolve the name of the node to a implementation class
	of the primitive"
	^ (ASN1Primitive withUniversalType: aNode name) new
		definingModule: module