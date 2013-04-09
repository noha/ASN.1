X.680 grammar
objectIdentifierValue 
	"spec: 
		ObjectIdentifierValue ::= 
			'{' ObjIdComponentsList '}' |	
			'{' DefinedValue ObjIdComponentsList '}'"
	"spec: 
		ObjIdComponentsList ::= 
			ObjIdComponents  |	
			ObjIdComponents ObjIdComponentsList"
	^ ${ asParser trim,
		((definedValue trim optional , objIdComponents trim plus) /
		(objIdComponents trim plus)), 
		$} asParser trim ==> #second