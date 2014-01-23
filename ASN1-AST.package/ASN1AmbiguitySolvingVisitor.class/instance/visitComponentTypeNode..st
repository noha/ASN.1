visiting
visitComponentTypeNode: aNode
	^ ASN1ClosestTypeDefinition 
		use: aNode
		during: [  super visitComponentTypeNode: aNode ]