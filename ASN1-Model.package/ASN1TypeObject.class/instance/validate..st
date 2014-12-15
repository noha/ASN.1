validating
validate: anObject
	(self acceptsValue: anObject) ifFalse: [ 
		Error signal: 'type classes do not match' ]