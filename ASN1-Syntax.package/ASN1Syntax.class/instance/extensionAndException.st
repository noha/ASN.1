X.680 grammar
extensionAndException
	"spec:
		ExtensionAndException ::= '...' | '...' ExceptionSpec"
	^ '...' asParser asn1Token, (exceptionSpec optional)