visiting
visitDefinedSyntaxObjectNode: aDefinedSyntaxObjectNode
	| parsed objectClass |
	"Process syntax for possible rewrites. For defined syntax objects the type information
	for a field value is stored in its class. We need to iterate all possible keys and resolve
	the type for that field in the class. With the type information we set the closest type
	definition to allow to acquire type information if needed"
	parsed := aDefinedSyntaxObjectNode parseSyntax.
	objectClass := aDefinedSyntaxObjectNode type definition.
	aDefinedSyntaxObjectNode syntax: (aDefinedSyntaxObjectNode syntax collect: [:each |
		each isLiteralNode 
			ifTrue: [ each ]
			ifFalse: [  
				(parsed keyAtIdentityValue: each) in: [ :key | 
					ASN1ClosestTypeDefinition 
						use: (objectClass fieldAt: key)
						during: [self visit: each ] ] ] 
	]).
	^ aDefinedSyntaxObjectNode 