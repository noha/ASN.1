accessing
expandFieldNamed: aFieldName type: aFieldType
	|  fieldValue |
	"if a value for the given fieldName is present just return it"
	map at: aFieldName ifPresent: [ :v | ^ v ].

	"if there is a factory provided for the field name use it. Otherwise
	use the type from the type definition of the field. Invoke #asAsn1TypeIn: 
	so that the factory is evaluated and produces a type that is suitable"
	fieldValue := (self 
		fieldFactoryAt: aFieldName 
		ifAbsent: [ aFieldType asn1ValueClass  ])
			instanceWithType: aFieldType.
		
	fieldValue 
		parent: self;
		initializeFrom: self.
		
	"create a value from the determined type and set the field with value"	
	^ map at: aFieldName put: fieldValue