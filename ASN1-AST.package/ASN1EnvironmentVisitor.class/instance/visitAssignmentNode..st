visiting
visitAssignmentNode: anAssignmentNode
	| depth |
	depth := 0.
	(anAssignmentNode left isScopeNode) ifTrue: [
		self enterScope: (ASN1Scope new scopeObject: anAssignmentNode left).
		depth := 1 ].
	(anAssignmentNode right isScopeNode) ifTrue: [
		self enterScope: (ASN1Scope new scopeObject: anAssignmentNode right).
		depth := depth + 1 ].
	super visitAssignmentNode: anAssignmentNode.
	depth timesRepeat: [ self leaveScope ]