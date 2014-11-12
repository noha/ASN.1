as yet unclassified
typeIdentifierClass
	^ (ASN1ASTParser 
		parse: ASN1Syntax typeIdentifier 
		startingAt: #objectClassAssignment)