actions
globalDeclarations
	^ ASN1ASTParser 
		parse: self class globalDeclarations 
		startingAt: #assignmentList