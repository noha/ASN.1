X.681 grammar
variableTypeValueFieldSpec
	"Spec:
		VariableTypeValueFieldSpec ::= valuefieldreference FieldName ValueOptionalitySpec ?"
	^ (valueFieldReference, fieldName, valueOptionalitySpec optional ) 