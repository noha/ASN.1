as yet unclassified
parseGrammar: aSymbol
	^ self parseGrammar: (self grammar: aSymbol) rule: #start 