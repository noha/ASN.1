visiting
visitDefinedSyntaxClassNode: aDefinedSyntaxClassNode 
	self
		pushScope: aDefinedSyntaxClassNode
		during: [  super visitDefinedSyntaxClassNode: aDefinedSyntaxClassNode ]