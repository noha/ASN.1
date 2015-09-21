mapping
applyMapping: aDictionary 
	aDictionary keysAndValuesDo: [ :typeName :factory |
		 (self typeNamed: typeName) valueFactory: factory ]