visiting
visitDefinedSyntaxObjectNode: aDefinedSyntaxObjectNode 
	"parse defined syntax and build map from field references to values. Resolve field 
	type references and value references like any other object.
	Field types are pushed to the scope chains because value references can refer to
	named types within a field type"
	| dict |
	dict := aDefinedSyntaxObjectNode parseSyntax.
	dict associations collect: [ :assoc | | field |
		field := (aDefinedSyntaxObjectNode type definition bindingOf: assoc key) definition.
		"grammar that resolves to a reference is likely not resolved to its definition. 
		We try this manually to bridge the gap here"
		field type ifNotNil: [  
			field type definition ifNil: [ 
				field type definition: (self resolveLabel: field type label) ].
			self 
				pushScope: field type definition 
				during: [  self visit: assoc value ] ] ]. 
	^  aDefinedSyntaxObjectNode  