visiting
visitComponentTypeNode: aNode
	^ self 
		provideType: aNode
		during: [  super visitComponentTypeNode: aNode ]