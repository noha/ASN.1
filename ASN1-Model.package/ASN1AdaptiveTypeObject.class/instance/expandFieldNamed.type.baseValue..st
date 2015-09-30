accessing
expandFieldNamed: aFieldName type: aFieldType baseValue: aValue

	"if a value for the given fieldName is present just return it"
	map at: aFieldName ifPresent: [ :v | ^ v ].

	"create a value from the determined type and set the field with value"	
	^ map at: aFieldName put: (
		(aFieldType newValue: aValue)
			initializeFrom: self )