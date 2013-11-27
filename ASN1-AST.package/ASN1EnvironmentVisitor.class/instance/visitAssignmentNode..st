visiting
visitAssignmentNode: anAssignmentNode
	"resolve left side of assignment and its type to add the left side type as scope 
	object when resolving the right side of the assignment. A right side value
	assignment could refer to the type of the assignment which is specified oon
	the left side"
	anAssignmentNode left hasType ifTrue: [ 
		 self visit: anAssignmentNode left type ].
	self visit: anAssignmentNode left.
	
	anAssignmentNode left providesScope ifTrue: [ 
		 self pushScope: anAssignmentNode left ].
	self visit: anAssignmentNode right