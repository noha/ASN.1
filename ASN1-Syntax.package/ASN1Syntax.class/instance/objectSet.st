X.681 grammar
objectSet
	"Spec:
		ObjectSet ::= '{' ObjectSetSpec '}' "
	^ ${ asParser asn1Token,
		objectSetSpec,
		$} asParser asn1Token ==> [:nodes| nodes second ]