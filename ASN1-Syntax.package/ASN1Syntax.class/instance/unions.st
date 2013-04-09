X.680 grammar
unions
	"Spec:
		Unions ::= 
			Intersections |
			UElems UnionMark Intersections"
	"Skipped UElems rule (UElems returns unions). Removed left recursion and simplyfied this rule at the same time"
	"Spec:
		UnionMark ::= '|' | UNION"
	^ (intersections separatedBy: (($| asParser / 'UNION' asParser) asn1Token )) withoutSeparators 