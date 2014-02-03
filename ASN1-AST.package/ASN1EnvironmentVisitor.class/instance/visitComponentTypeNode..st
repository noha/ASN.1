visiting
visitComponentTypeNode: aNode 
	self 
		pushScope: aNode 
		during: [  super visitComponentTypeNode: aNode ]
