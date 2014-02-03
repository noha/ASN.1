resolving
defaultModule
	| module |
	ASN1Configuration default failOnReservedWords: false.
	module := ASN1ModuleDefinitionNode new.
	"oid repository gives oid 2.5.9 for abstract syntax so we are using 2.5
	as the module oid"
	module identifier: (ASN1ModuleIdentifierNode new
		name: 'default';
		oid: (ASN1ObjectIdNode fromString: '2.5')).
	module assignments 
			add: self abstractSyntaxClass ;
			add: self typeIdentifierClass;
			addAll: self globalDeclarations.
	ASN1Configuration default failOnReservedWords: true.
	^ module