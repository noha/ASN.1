as yet unclassified
storeModule: aString named: moduleName
	self 
		compile: (self escape: aString) 
		selector: (self selectorNameFrom: moduleName)