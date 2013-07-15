*asn1-ast
buildAst
	"read configured root modules, then load all imported modules
	recursively"
	| ast |
	ast := ASN1ASTRoot new.
	self rootModuleNames do: [:moduleName| 
		ast addModuleFrom: (self contentsOfModuleNamed: moduleName) ].
	[ ast addImportedModules ]
		on: ASN1MissingModule 
		do: [:err| err resume:  (
			ast parseModuleFrom: (
			self contentsOfModuleNamed:  err identifier name label)) ].
	^ ast