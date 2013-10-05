visiting
visitEnumerated: anEnumerated
	stack top isString ifFalse: [ Error signal: 'expected string for ', anEnumerated asString ].
	^ self 
		push: (anEnumerated atName: stack top) number
		during: [ self visitPrimitive: anEnumerated  ]
