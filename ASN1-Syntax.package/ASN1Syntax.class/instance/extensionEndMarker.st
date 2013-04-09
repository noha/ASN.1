X.680 grammar
extensionEndMarker
	"spec:
		ExtensionEndMarker ::= ',' '..'"
	^ $, asParser trim, '...' asParser trim