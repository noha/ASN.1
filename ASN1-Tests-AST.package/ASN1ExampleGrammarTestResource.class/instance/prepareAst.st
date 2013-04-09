as yet unclassified
prepareAst
	(self  ast modules size = 1) ifTrue: [
		self  ast 
			addModule: (self parseGrammar: #example);
			addModule: (self parseGrammar: #referenced).
		self ast annotateAsts].
	^ self  ast