as yet unclassified
parseGrammar: aString rule: aSymbol
	^ self parserClass parse: aString startingAt: aSymbol	