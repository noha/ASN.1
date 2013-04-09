visiting
visitDefinedSyntaxObjectNode: aDefinedSyntaxObjectNode 
	aDefinedSyntaxObjectNode syntax: (self visitAll: aDefinedSyntaxObjectNode syntax).
	^ aDefinedSyntaxObjectNode 