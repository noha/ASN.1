as yet unclassified
validateValue: aValueNode
	aValueNode isValueNode ifFalse: [
		Error signal: 'is not a value node'].
	^ aValueNode hasSameType: self 