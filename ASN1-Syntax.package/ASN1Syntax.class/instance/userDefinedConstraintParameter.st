X.682 grammar
userDefinedConstraintParameter
	"Spec:
		UserDefinedConstraintParameter ::= Governor ':' Value
		| Governor ':' ValueSet
		| Governor ':' Object
		| Governor ':' ObjectSet
		| Type
		| DefinedObjectClass"
	^ (governor, $: asParser, (value / valueSet / object / objectSet)) 
		/ type
		/ definedObjectClass 