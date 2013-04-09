X.680 grammar
definitiveIdentification
	"Spec:
		DefinitiveIdentification ::= 
			DefinitiveOID  |	
			DefinitiveOIDandIRI  |
			empty"
	"Spec:
		DefinitiveOIDandIRI ::= 
			DefinitiveOID IRIValue"
	^(definitiveOid, iriValue optional) optional 

	