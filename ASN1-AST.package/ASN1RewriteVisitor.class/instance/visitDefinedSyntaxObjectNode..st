visiting
visitDefinedSyntaxObjectNode: aDefinedSyntaxObjectNode
	| parsed objectClass |
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