visiting
visitTaggedTypeNode: aTypeNode 
	self visit: aTypeNode type.
	self visit: aTypeNode tag.
	^ aTypeNode