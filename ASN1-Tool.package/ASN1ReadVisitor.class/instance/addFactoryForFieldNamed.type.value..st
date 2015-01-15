accessing
addFactoryForFieldNamed: aFieldName type: aType value: aValue

	(aValue fieldFactoryAt: aFieldName) ifNotNil: [ :factory |
		factories 
			at:  aType singularType
			put: factory  ]