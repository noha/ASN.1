X.680 grammar
namedNumber
	"spec:
		NamedNumber ::=
   			identifier '(' SignedNumber ')' |
   			identifier '(' DefinedValue ')'"
	^ identifier , $( asParser trim , ( signedNumber / definedValue ), $) asParser trim
		==> [:nodes| Array with: nodes first with: nodes third ]