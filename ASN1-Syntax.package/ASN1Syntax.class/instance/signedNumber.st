X.680 grammar
signedNumber
	"spec:
		SignedNumber ::=
   			number |
   			'-' number"
	^ $- asParser optional, number