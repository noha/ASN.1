X.680 grammar
definitiveObjIdComponent
	"Spec:
		DefinitiveObjIdComponent ::= 
			NameForm |	
			DefinitiveNumberForm  |	
			DefinitiveNameAndNumberForm"
	"Spec: DefinitiveNumberForm	::= number"
	"spec: NameForm ::= identifier"
	^ definitiveNameAndNumberForm / 
		identifier /
		number "definitiveNumberForm"
		