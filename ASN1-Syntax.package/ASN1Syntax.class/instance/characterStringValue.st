X.680 grammar
characterStringValue
	"Spec:
		CharacterStringValue ::= 
			RestrictedCharacterStringValue |	
			UnrestrictedCharacterStringValue"
	"Spec:
		UnrestrictedCharacterStringValue ::= SequenceValue"
	^ restrictedCharacterStringValue / sequenceValue 