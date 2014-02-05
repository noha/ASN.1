visiting
visitAssignmentNode: aNode
	^ self 
		provideType: aNode left type
		during: [  super visitAssignmentNode: aNode ]