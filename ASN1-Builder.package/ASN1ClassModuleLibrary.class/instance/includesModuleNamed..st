testing
includesModuleNamed: aString 
	^ self respondsTo: (self selectorNameFrom: aString)