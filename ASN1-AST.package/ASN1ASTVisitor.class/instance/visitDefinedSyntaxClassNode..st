visiting
visitDefinedSyntaxClassNode: aDefinedSyntaxClass 
	self visitAll: aDefinedSyntaxClass fields.
	"self visitAll: aDefinedSyntaxClass syntax."
	^ aDefinedSyntaxClass 