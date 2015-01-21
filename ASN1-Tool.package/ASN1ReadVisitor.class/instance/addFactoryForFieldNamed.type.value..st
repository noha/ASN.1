accessing
addFactoryForFieldNamed: aFieldName type: aType value: aValue

	(aValue fieldFactoryAt: aFieldName) ifNotNil: [ :factory |
		fieldFactories 
			at:  aType basicType singularType 
			put: factory  ]