X.680 grammar
numberForm
	"spec:
		NumberForm ::= number | DefinedValue"
	^ (number / definedValue) flatten trim