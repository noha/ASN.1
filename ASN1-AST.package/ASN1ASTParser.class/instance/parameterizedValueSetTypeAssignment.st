X.683 grammar
parameterizedValueSetTypeAssignment
	^ super parameterizedValueSetTypeAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: nodes fifth]