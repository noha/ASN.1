resolving
resolveType
	| fieldType |
	fieldType := self type.
	self fields do: [:field|
		fieldType := (fieldType definition bindingOf: field label) type ].
	^ fieldType ifNil: [ ASN1OpenTypeNode  new ]
