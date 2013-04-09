X.683 grammar
parameterizedAssignment
	"Spec:
		ParameterizedAssignment ::= 
			ParameterizedTypeAssignment |
			ParameterizedValueAssignment |
			ParameterizedValueSetTypeAssignment |
			ParameterizedObjectClassAssignment |
			ParameterizedObjectAssignment |
			ParameterizedObjectSetAssignment"
	^ parameterizedTypeAssignment / 
		parameterizedValueAssignment /
		parameterizedValueSetTypeAssignment /
		parameterizedObjectClassAssignment /
		parameterizedObjectAssignment /
		parameterizedObjectSetAssignment 