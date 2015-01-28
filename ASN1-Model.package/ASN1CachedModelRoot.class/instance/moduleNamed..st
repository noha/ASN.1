accessing
moduleNamed: aString 
	^ moduleByName 
		at: aString asSymbol
		ifAbsentPut: [ super moduleNamed: aString ] 