as yet unclassified
headFor: aSymbol
	^ self perform: (self methodWithPragma: #head asMutator andArgument: aSymbol).