X.680 grammar
definedType
	"spec:
		DefinedType ::= 
			ExternalTypeReference |
			typereference |
			ParameterizedType |
			ParameterizedValueSetType"
	^ parameterizedType / parameterizedValueSetType / 
		externalTypeReference /  typeReferenceToken 
		