visiting
visitAssignmentNode: aNode
	aNode right beAssigned.
	^ (super visitAssignmentNode: aNode)
			