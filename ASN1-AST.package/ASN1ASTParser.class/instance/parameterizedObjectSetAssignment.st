X.683 grammar
parameterizedObjectSetAssignment
	^ super parameterizedObjectSetAssignment ==> [:nodes| 
		 ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: nodes fourth ] 