validating
validateType: aType value: aValue
	| oldValue |
	oldValue := value.
	value := aValue.
	[ self visit: aType ] 
		ensure: [ value := oldValue ]