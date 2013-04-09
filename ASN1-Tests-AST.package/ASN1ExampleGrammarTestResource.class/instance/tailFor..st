as yet unclassified
tailFor: aSymbol
	^ self perform: (self methodWithPragma: #tail asMutator andArgument: aSymbol).