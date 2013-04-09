X.683 grammar
actualParameterList
	|  actualParameter |
	"Spec:
		ActualParameter ::= Type | Value | ValueSet | DefinedObjectClass | Object | ObjectSet"
	actualParameter := type / objectSet / object / valueSet / definedObjectClass / value.
	"Spec:
		ActualParameterList ::= '{' ActualParameter ',' + '}' "
	^ ${ asParser trim,  
		(actualParameter separatedBy:  $, asParser trim) withoutSeparators , 
		$} asParser trim ==> #second