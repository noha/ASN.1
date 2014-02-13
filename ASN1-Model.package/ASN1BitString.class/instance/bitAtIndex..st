accessing
bitAtIndex: aNumber 
	^ (self bits detect: [ :each | each value = aNumber ]) name