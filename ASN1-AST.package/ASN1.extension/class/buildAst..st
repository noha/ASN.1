*asn1-ast
buildAst: aStringOrStream
	^ ASN1ASTParser parse: aStringOrStream 