X.680 grammar
extensionDefault
	"Spec:
		ExtensionDefault ::=
			EXTENSIBILITY IMPLIED |
			empty"
	^ ('EXTENSIBILITY IMPLIED' asParser trim) optional