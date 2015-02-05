visiting
visitSelectionTypeNode: aNode
	"a selection type selects one slot of a collection type. We need to resolve the type first
	and then find the the element with corresponding name"
	|  element |
	element := (self visit: aNode type) elements at: aNode name
		"detect: [:each| each key = aNode name]".
	^ element value