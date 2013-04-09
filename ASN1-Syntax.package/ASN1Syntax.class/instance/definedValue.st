X.680 grammar
definedValue
	"spec:
		DefinedValue ::=
   			ExternalValueReference |
   			valuereference |
   			ParameterizedValue"
	^ parameterizedValue / externalValueReference / valueReference