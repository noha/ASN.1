visiting
visitAssignmentNode: anAssignment
	| right |
	right := (self visit: anAssignment right).
"	(right isAsn1 and: [ anAssignment right isAsn1ReferenceNode not ]) ifTrue: [
		right definingModule: module ]. 
"	^ anAssignment left label -> right
		