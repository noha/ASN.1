visiting
visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode
	^ aDefaultSyntaxClassNode fields: (self visitAll: aDefaultSyntaxClassNode fields).
