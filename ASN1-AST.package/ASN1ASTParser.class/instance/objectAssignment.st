X.681 grammar
objectAssignment
	^ super objectAssignment ==> [:nodes|
		ASN1AssignmentNode new
			left: (nodes first
				type: nodes second;
				declaration: true);
			right: (nodes fourth
				type: nodes second) ]