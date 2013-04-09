visiting
visitObjectIdentifierNode: aNode
	| components |
	components := self resolveToComponents: aNode.
	components := self resolveReferencesOf: components.
	^ aNode components: components
		