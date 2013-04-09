X.680 grammar
setOfType
	"Spec:
		SetOfType ::= 
			SET OF Type |
			SET OF NamedType"
	^ 'SET' asParser trim, 'OF' asParser trim, (type / namedType) ==> #third