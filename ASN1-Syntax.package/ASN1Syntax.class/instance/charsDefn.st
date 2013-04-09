X.680 grammar
charsDefn
	"spec:
		CharsDefn ::= 
			cstring |	
			Quadruple |	
			Tuple |	
			DefinedValue"
	^ cString / quadruple / tuple / definedValue