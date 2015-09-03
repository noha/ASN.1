X.681 grammar
objectSetAssignment
	^ super objectSetAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
				type: nodes second;
				declaration: true);
			right: (nodes third type: nodes second) ]