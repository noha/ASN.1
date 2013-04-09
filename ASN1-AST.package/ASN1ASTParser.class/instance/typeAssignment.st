X.680 grammar
typeAssignment
	^ super typeAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first asn1Reference declaration: true);
			right: nodes second ]