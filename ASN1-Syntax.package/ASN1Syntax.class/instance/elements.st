X.680 grammar
elements
	"Spec:
		Elements ::= 
			SubtypeElements |
			ObjectSetElements |	
			'(' ElementSetSpec ')' "
	^ subTypeElements /
		objectSetElements /
		(( $( asParser trim, elementSetSpec, $) asParser trim ) ==> #second)