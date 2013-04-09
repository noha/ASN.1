X.680 grammar
definitiveOid
	"Spec:
		DefinitiveOID ::= '{' DefinitiveObjIdComponentList '}' "
	"Spec:
		DefinitiveObjIdComponentList ::= 
			DefinitiveObjIdComponent |
			DefinitiveObjIdComponent DefinitiveObjIdComponentList"
	^ (${ asParser trim,
		definitiveObjIdComponent trim plus, 
		$} asParser trim) ==> #second