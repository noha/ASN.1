accessing
addFactoryForKey: aFieldName type: aType value: aValue

	(aValue fieldFactoryAt: aFieldName) ifNotNil: [ :factory |
		valueMap 
			at:  aType singularType
			put: factory  ]