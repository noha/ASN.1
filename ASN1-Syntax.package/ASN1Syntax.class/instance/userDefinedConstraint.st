X.682 grammar
userDefinedConstraint
	"Spec:
		UserDefinedConstraint ::= CONSTRAINED BY '{' UserDefinedConstraintParameter ',' * '}' "
	^ 'CONSTRAINED' asParser trim, 'BY' asParser, 
		${ asParser asn1Token trim , 
			(userDefinedConstraintParameter separatedBy: $, asParser trim) optional, 
		$} asParser asn1Token trim