X.680 grammar
restrictedCharacterStringValue
	"Spec:
		RestrictedCharacterStringValue ::= 
			cstring |	
			CharacterStringList |
			Quadruple |
			Tuple"
	^ cString / characterStringList / quadruple / tuple 