as yet unclassified
ast
	^ ast ifNil: [ 
		ast := ASN1ASTRoot new.
		self prepareAst.
		ast ]