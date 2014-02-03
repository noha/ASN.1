actions
abstractSyntaxClass
	 ^ (ASN1ASTParser 
		parse: ASN1Syntax abstractSyntax 
		startingAt: #objectClassAssignment).
