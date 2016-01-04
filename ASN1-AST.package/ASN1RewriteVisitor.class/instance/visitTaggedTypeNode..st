visiting
visitTaggedTypeNode: aNode
	| type |
	aNode tag: (self visit: aNode tag).
	type := (self visit: aNode type).
	aNode type: type. 
	^ aNode