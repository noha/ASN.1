X.681 grammar
objectClassDefn
	"Spec:
		ObjectClassDefn ::= CLASS '{' FieldSpec ',' + '}' WithSyntaxSpec?"
	^ ('CLASS' asParser trim, 
		${ asParser asn1Token, 
			(fieldSpec separatedBy:  $, asParser trim) withoutSeparators,
		$} asParser asn1Token, 
		withSyntaxSpec optional trim) ==> [:nodes| Array with: nodes third with: nodes fifth ]