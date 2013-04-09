as yet unclassified
parseModelFrom: aString rule: aSymbol
	^ self createModelFromAst: (
		self parseGrammar: aString rule: aSymbol)