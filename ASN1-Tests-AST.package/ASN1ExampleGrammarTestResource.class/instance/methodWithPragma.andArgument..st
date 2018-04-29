as yet unclassified
methodWithPragma: aSymbol andArgument: anotherSymbol
	^ ((Pragma allNamed: aSymbol in: self class)
		detect: [:pragma| 
			pragma arguments first = anotherSymbol ]) method selector