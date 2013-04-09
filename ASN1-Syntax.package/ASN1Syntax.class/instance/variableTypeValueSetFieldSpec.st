X.681 grammar
variableTypeValueSetFieldSpec
	"Spec:
		VariableTypeValueSetFieldSpec ::= valuesetfieldreference FieldName ValueSetOptionalitySpec?"
	^ valueSetFieldReference, fieldName trim , valueSetOptionalitySpec optional