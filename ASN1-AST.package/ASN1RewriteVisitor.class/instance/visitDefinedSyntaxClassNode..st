visiting
visitDefinedSyntaxClassNode: aDefinedSyntaxClass 
	aDefinedSyntaxClass fields: (self visitAll: aDefinedSyntaxClass fields).
	aDefinedSyntaxClass syntax: (self visit: aDefinedSyntaxClass syntax).
	^ aDefinedSyntaxClass 