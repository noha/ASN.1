visiting
visitTaggedTypeNode: aNode
	| type |
	aNode tag: (self visit: aNode tag).
	type := (self visit: aNode type).
	type isCollection ifTrue: [ self halt ].
	aNode type: type. 
	^ aNode