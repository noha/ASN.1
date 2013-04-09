X.680 grammar
intersections
	"Spec:
		Intersections ::= 
			IntersectionElements |
			IElems IntersectionMark IntersectionElements"
	"Skipped IElems rule (IElems returns intersections). This would introduce a left recursion which can resolved to a star parser"
	"Spec:
		IntersectionMark ::= 
			'^' |
			INTERSECTION"
	"Spec:
		IntersectionElements ::= Elements | Elems Exclusions"
	"elems contains only elements. Removed elems rule to simplify this rule"
	"included intersectionElements rule"
	^ ((elements, exclusions optional) separatedBy: ( $^ asParser trim / 'INTERSECTION' asParser trim)) withoutSeparators 