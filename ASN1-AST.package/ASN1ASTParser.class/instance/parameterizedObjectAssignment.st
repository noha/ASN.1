X.683 grammar
parameterizedObjectAssignment
	^ super parameterizedObjectAssignment ==> [:nodes| 
		 ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: (nodes fifth
				type: nodes third) ] 