visiting
visitTypeFieldNode: aNode
	| type |
	type := aNode type.
	self resolveReference: type.
	aNode fields do: [:field|
		type := type definition typeOf: field label.
		type isAsn1ReferenceNode ifTrue: [
			self resolveReference: type  ]].
