X.680 grammar
extensionAdditionAlternativesList
	"Spec:
		ExtensionAdditionAlternativesList ::= 
			ExtensionAdditionAlternative |
			ExtensionAdditionAlternativesList ',' ExtensionAdditionAlternative"
	^(extensionAdditionAlternative separatedBy: $, asParser trim) withoutSeparators 