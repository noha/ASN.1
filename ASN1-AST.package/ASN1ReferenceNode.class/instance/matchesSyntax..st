testing
matchesSyntax: anObject
	anObject isAsn1Node ifFalse: [ ^ false ].
	^ anObject isAsn1ReferenceNode 