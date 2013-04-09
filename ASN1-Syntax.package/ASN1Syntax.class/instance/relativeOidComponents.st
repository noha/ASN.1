X.680 grammar
relativeOidComponents
	"Spec:
		RelativeOIDComponents ::= 
			NumberForm |
			NameAndNumberForm |
			DefinedValue"
	^ nameAndNumberForm / numberForm / definedValue 