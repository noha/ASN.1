as yet unclassified
visitAssignmentNode: aNode
	aNode right beAssigned.
	^ (super visitAssignmentNode: aNode)
			