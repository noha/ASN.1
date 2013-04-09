X.680 grammar
valueSetTypeAssignment
	^ super valueSetTypeAssignment ==> [:nodes|
		ASN1AssignmentNode new
			left: (nodes first asn1Reference 
					type: nodes second;
					declaration: true);
			right: nodes third ]