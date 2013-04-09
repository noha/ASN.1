visiting
visitAssignmentNode: aNode
	(aNode right isTypeNode & aNode right isPrimitiveNode not)
		ifTrue: [ self visit: aNode right ]
		ifFalse: [ candidates removeKey: aNode right ifAbsent: []  ].
