resolving
defaultModule
	| module |
	ASN1Configuration default failOnReservedWords: false.
	module := ASN1ModuleDefinitionNode new.
	module identifier: ASN1ModuleIdentifierNode new.
	module	assignments 
			add: (ASN1ASTParser parse: ASN1Syntax abstractSyntax startingAt: #objectClassAssignment);
			add: (ASN1ASTParser parse: ASN1Syntax typeIdentifier startingAt: #objectClassAssignment);
			addAll: (ASN1ASTParser parse: self class globalDeclarations startingAt: #assignmentList).
	ASN1Configuration default failOnReservedWords: true.
	^ module