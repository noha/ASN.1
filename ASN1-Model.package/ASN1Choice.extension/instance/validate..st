validating
validate: aValue 

	(aValue size = 1) ifFalse: [ 
		Error signal: 'object contains more than one key which is not valid for a choice type' ].
	(elements anySatisfy: [ :each | each key = aValue keys first]) ifFalse: [ 
		Error signal: 'key in object does not match type' ].
	self 
		validateType: ( self elementAt: aValue keys first ) value
		value: aValue values first
