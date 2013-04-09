visiting
visitTypeFieldNode: aNode
	| result |
	result := aNode resolveType.
	[ result isAsn1ReferenceNode ] whileTrue: [
		result := result definition ].
	^ self visit: result 
