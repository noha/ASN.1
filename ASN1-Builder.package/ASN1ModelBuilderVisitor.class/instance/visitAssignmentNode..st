visiting
visitAssignmentNode: anAssignment
	| right |
	right := (self visit: anAssignment right).
	^ anAssignment left label -> right
		