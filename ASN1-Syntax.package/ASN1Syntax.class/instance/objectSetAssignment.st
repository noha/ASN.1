X.681 grammar
objectSetAssignment
	"Spec:
		ObjectSetAssignment ::= objectsetreference DefinedObjectClass '::=' ObjectSet"
	^ objectSetReference trim, definedObjectClass, '::=' asParser trim, objectSet 
		==> [:nodes| Array with: nodes first with: nodes second with: nodes fourth ]