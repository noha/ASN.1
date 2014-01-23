visiting
visitModifierDefaultValueNode: aNode 
	aNode value: (self visit: aNode value).
	^ aNode