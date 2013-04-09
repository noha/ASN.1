X.681 grammar
defaultSyntax 
	"Spec:
		DefaultSyntax ::= '{' FieldSetting ',' * '}' "
	^ (${ asParser trim, 
		(fieldSetting separatedBy: $, asParser trim) withoutSeparators optional ,
		$} asParser trim ) ==> #second