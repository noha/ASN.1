X.680 grammar
iriValue
	"Spec:
		IRIValue ::= '""'
			FirstArcIdentifier SubsequentArcIdentifier '""' '"
	"Spec: FirstArcIdentifier ::= '/' ArcIdentifier"
	"Spec: ArcIdentifier ::= 
			integerUnicodeLabel |	
			non-integerUnicodeLabel"
	"Spec: SubsequentArcIdentifier ::= 
			'/' ArcIdentifier SubsequentArcIdentifier |
			empty"
	self flag: #nottested.
	^ $" asParser trim, 
		($/ asParser trim, (integerUnicodeLabel / nonIntegerUnicodeLabel)) plus,
		$" asParser trim