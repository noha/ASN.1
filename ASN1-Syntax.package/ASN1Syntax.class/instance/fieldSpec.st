X.681 grammar
fieldSpec
	"Spec:
		FieldSpec ::=
			TypeFieldSpec |
			FixedTypeValueFieldSpec |
			VariableTypeValueFieldSpec |
			FixedTypeValueSetFieldSpec | 
			VariableTypeValueSetFieldSpec |
			ObjectFieldSpec |
			ObjectSetFieldSpec"
	^ fixedTypeValueFieldSpec /
		variableTypeValueFieldSpec / fixedTypeValueSetFieldSpec /
		variableTypeValueSetFieldSpec / objectFieldSpec / objectSetFieldSpec /
		typeFieldSpec 