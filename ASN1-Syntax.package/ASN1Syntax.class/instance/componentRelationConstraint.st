X.682 grammar
componentRelationConstraint
	"ComponentRelationConstraint ::= '{' DefinedObjectSet '}' '{' AtNotation ',' + '}' "
	^ ${ asParser trim, definedObjectSet, $} asParser trim, 
		${ asParser trim, (atNotation separatedBy: $, asParser), $} asParser trim