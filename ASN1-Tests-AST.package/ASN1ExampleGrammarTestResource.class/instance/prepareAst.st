as yet unclassified
prepareAst
	self  ast modules ifEmpty: [
		self ast addModule: (ASN1DefaultModuleLibrary new moduleNamed: 'default').
		self  ast 
			addModule: (self parseGrammar: #example);
			addModule: (self parseGrammar: #referenced).
		self ast annotateAsts].
	^ self  ast