accessing
addFactoryForFieldNamed: aFieldName type: aType value: aValue

	(aValue fieldFactoryAt: aFieldName) ifNotNil: [ :factory |
		factories 
			at:  aType basicType singularType 
			put: factory  ]