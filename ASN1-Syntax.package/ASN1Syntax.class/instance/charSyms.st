X.680 grammar
charSyms
	"spec:
		CharSyms ::= 
			CharsDefn |	
			CharSyms ',' CharsDefn"
	^ charsDefn separatedBy: $, asParser trim