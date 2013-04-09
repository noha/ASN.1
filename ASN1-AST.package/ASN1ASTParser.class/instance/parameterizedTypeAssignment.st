X.683 grammar
parameterizedTypeAssignment
	^ super parameterizedTypeAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					declaration: true;
					parameters: nodes second);
			right: nodes fourth ]