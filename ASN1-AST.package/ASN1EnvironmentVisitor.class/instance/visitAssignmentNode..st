visiting
visitAssignmentNode: anAssignmentNode
	| depth |
	depth := 0.
	(anAssignmentNode left isScopeNode) ifTrue: [
		self pushScope: anAssignmentNode left.
		depth := 1 ].
	(anAssignmentNode right isScopeNode) ifTrue: [
		self pushScope: anAssignmentNode right.
		depth := depth + 1 ].
	super visitAssignmentNode: anAssignmentNode.
	depth timesRepeat: [ self popScope ]