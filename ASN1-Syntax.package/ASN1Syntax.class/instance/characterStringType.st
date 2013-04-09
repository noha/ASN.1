X.680 grammar
characterStringType
	"spec:
		CharacterStringType ::= 
			RestrictedCharacterStringType |	
			UnrestrictedCharacterStringType"
	^ restrictedCharacterStringType / 'CHARACTER STRING' asParser "unrestrictedCharacterStringType"
