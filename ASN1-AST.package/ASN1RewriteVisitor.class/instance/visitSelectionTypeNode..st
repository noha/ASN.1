visiting
visitSelectionTypeNode: aSelectionTypeNode 
	^ aSelectionTypeNode type: (self visit: aSelectionTypeNode type)
	