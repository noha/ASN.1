X.683 grammar
parameterizedReference 
	^ super parameterizedReference ==> [:nodes| | params |
		params := nodes second 
			ifNotNil: [ nodes second allButFirst allButLast ]
			ifNil: [ nil ].
		 nodes first parameters: params ]