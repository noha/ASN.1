X.683 grammar
parameterizedValueAssignment
	^ super parameterizedValueAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: nodes fourth ]