visiting
visitDefinedSyntaxObjectNode: aNode
	|  dict |
	dict := aNode parseSyntax.
	dict associations do: [:assoc| | val |
		assoc value dereferenced isTypeNode
			ifTrue: [ val := assoc value ]
			ifFalse: [
				val := aNode type dereferenced
					instantiateFieldAt: assoc key value: assoc value dereferenced].
		assoc value: (self visit: val)
		].
	^ ASN1ObjectType new
		clazz: aNode type label;
		definingModule: module;
		initializeFromDict: dict