accessing
type: anObject
	anObject isAsn1Node ifFalse: [ self halt ].
	self propertyAt: #type put: anObject