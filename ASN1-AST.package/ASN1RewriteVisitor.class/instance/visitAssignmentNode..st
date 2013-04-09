visiting
visitAssignmentNode: anAssignmentNode 
	anAssignmentNode left: (self visit: anAssignmentNode left).
	anAssignmentNode right: (self visit: anAssignmentNode right).
	^ anAssignmentNode