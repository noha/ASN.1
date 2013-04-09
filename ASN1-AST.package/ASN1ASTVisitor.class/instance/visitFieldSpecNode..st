visiting
visitFieldSpecNode: aFieldSpec 
	self visit: aFieldSpec type.
	self flag: #needsRedesign.
	^ aFieldSpec 