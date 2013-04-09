visiting
visitAssignmentNode: anAssignmentNode
	self visit: anAssignmentNode left.
	self visit: anAssignmentNode right.
	^ anAssignmentNode