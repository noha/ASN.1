accessing
tagEnvironment: anObject
	anObject ifNil: [ ^ self ].
	self propertyAt: #tagEnvironment put: anObject