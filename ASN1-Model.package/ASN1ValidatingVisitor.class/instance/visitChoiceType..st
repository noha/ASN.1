visiting
visitChoiceType: aChoice
	
	(value size = 1) ifFalse: [ 
		Error signal: 'object contains more than one key which is not valid for a choice type' ].
	(aChoice elements anySatisfy: [ :each | each key = value keys first]) ifFalse: [ 
		Error signal: 'key in object does not match type' ].
	self 
		validateType: ( aChoice elementAt: value keys first ) value
		value: value values first
