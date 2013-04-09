X.683 grammar
parameterizedObjectClassAssignment
	^ super parameterizedObjectClassAssignment ==> [:nodes| 
		self halt.
		 ASN1AssignmentNode new
			left: (nodes first
					declaration: true;
					parameters: nodes second);
			right: nodes third ] 