X.682 grammar
atNotation 
	"Spec: 
		AtNotation ::= '@' ComponentIdList | '@.' Level ComponentIdList
		ComponentIdList ::= identifier '.' +
		Level ::= '.' Level | empty"
	^ ($@ asParser, identifier separatedBy: $. asParser) 
		/ ('@.' asParser, $. asParser star, (identifier separatedBy: $. asParser))