mapping
applyMapping: aDictionary 
	aDictionary keysAndValuesDo: [ :typeName :factory |
		 (self typeNamed: typeName) basicType valueFactory: factory ]