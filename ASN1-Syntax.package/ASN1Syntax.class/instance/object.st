X.681 grammar
object
	"Spec:
		Object ::= 
			DefinedObject | 
			ObjectDefn | 
			ObjectFromObject |
			 ParameterizedObject"
	^  parameterizedObject / objectDefn / objectFromObject  / definedObject   