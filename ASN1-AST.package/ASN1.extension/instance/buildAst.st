*asn1-ast
buildAst
	"read configured root modules, then load all imported modules
	recursively"
	| ast |
	ast := ASN1ASTRoot new.
	self libraries rootModulesDo: [ :module |
		 module addAsModuleTo: ast ].
	[ ast addImportedModules ]
		on: ASN1MissingModule 
		do: [:err| 
			err resume: (ast parseModuleFrom: (self libraries moduleNamed: err identifier name label)) ].
	ast optimizeModuleOrder.
	^ ast