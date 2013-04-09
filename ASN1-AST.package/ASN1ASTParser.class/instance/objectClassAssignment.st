X.681 grammar
objectClassAssignment
	^ super objectClassAssignment ==> [:nodes| 
		ASN1AssignmentNode new 
			left: (nodes first
				declaration: true);
			right:  nodes third ] 