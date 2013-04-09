X.680 grammar
extensionAdditionAlternatives
	"Spec:
		ExtensionAdditionAlternatives ::= 
			',' ExtensionAdditionAlternativesList |
			empty"
	^ ($, asParser trim, extensionAdditionAlternativesList ) optional