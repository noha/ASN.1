visiting
visitEnumerated: anEnumerated
	currentValue isString ifFalse: [ Error signal: 'expected string for ', anEnumerated asString ].
	^ self 
		push: (anEnumerated atName: currentValue) number
		during: [ self visitPrimitive: anEnumerated  ]
