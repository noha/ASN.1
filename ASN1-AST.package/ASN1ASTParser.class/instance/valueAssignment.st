X.680 grammar
valueAssignment
	^ super valueAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes second;
					declaration: true);
			right:  nodes third 
		]