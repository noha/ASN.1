visiting
visitFieldSpecNode: aFieldSpec 
	aFieldSpec type: (self visit: aFieldSpec type).
	^ aFieldSpec 