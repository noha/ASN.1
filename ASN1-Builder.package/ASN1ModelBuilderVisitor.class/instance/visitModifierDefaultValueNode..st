visiting
visitModifierDefaultValueNode: aNode 
	^ ASN1ModifierDefaultValue  new 
		value: (self visit: aNode value)