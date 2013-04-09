X.680 grammar
objIdComponents
	"spec: 
		ObjIdComponents ::= 
			NameForm |	
			NumberForm |	
			NameAndNumberForm  |	
			DefinedValue"
	"spec:
		NameForm ::= identifier"
	^ nameAndNumberForm / identifier /  numberForm / definedValue