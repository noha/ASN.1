X.680 grammar
subTypeElements
	| permittedAlphabet |
	"Spec:
		SubtypeElements ::= 
			SingleValue | ContainedSubtype | ValueRange |
			PermittedAlphabet | SizeConstraint | TypeConstraint |
			InnerTypeConstraints | PatternConstraint | PropertySettings |
			DurationRange | TimePointRange | RecurrenceRange "
	"Spec: DurationRange ::= ValueRange"
	"Spec: PermittedAlphabet ::= FROM Constraint"
	permittedAlphabet :=  'FROM' asParser trim, constraint.
	"Spec: RecurrenceRange ::= ValueRange"
	"Spec: TimePointRange ::= ValueRange"
	"Spec: TypeConstraint ::= Type"
	"Spec: SingleValue ::= Value"
	^ valueRange / containedSubtype / permittedAlphabet / sizeConstraint /
		 innerTypeConstraints / patternConstraint / propertySettings /
		valueRange "durationRange" / valueRange "timePointRange" / valueRange "recurrenceRange"  /  value "singleValue" / type "typeConstraint"