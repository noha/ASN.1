X.680 grammar
exceptionIdentification
	"spec:
	ExceptionIdentification ::=
            SignedNumber |
            DefinedValue |
           Type ':' Value"
	^ signedNumber / definedValue / ( type , $: asParser, value)