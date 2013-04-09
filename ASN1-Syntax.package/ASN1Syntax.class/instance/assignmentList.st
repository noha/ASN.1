X.680 grammar
assignmentList
	"spec:
		AssignmentList ::=
   			Assignment |
   			AssignmentList Assignment"
	"spec:
		Assignment ::=
   			TypeAssignment | ValueAssignment | XMLValueAssignment | ValueSetTypeAssignment |
   			ObjectClassAssignment | ObjectAssignment | ObjectSetAssignment | ParameterizedAssignment"
	^ (typeAssignment /
		valueAssignment /
		valueSetTypeAssignment /
		objectClassAssignment /
		objectAssignment /
		objectSetAssignment / 
		parameterizedAssignment ) trim plus optional