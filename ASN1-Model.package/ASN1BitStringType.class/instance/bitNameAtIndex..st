accessing
bitNameAtIndex: aNumber 
	^ (self namedBits detect: [ :each | each value = aNumber ]) name