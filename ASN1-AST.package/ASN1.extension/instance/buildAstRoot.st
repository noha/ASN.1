*asn1-ast
buildAstRoot
	| astRoot |
	astRoot := ASN1ASTRoot new.
	self rootModuleNames do: [:moduleName| 
		astRoot addModuleFrom: (self contentsOfModuleNamed: moduleName) ].
	^ astRoot