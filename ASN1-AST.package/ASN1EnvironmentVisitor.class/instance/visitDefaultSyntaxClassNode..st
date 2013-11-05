visiting
visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode 
	self 
		pushScope: aDefaultSyntaxClassNode 
		during: [  super visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode ]
