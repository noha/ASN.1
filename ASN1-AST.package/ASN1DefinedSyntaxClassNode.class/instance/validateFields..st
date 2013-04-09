as yet unclassified
validateFields: aDictionary
	self fields do: [:field| | value |
		aDictionary at: field name label ifAbsent: [.
			(field isOptional or: [ field hasDefaultValue ]) ifFalse: [ 
				Error signal: 'missing field ', field name printString  ].
			(field type notNil and: [ field hasDefaultValue ]) ifTrue: [
				(field type validateValue: field defaultValue) ifFalse: [
					Error signal: 'field default value type does not conform to field type'] ]]]