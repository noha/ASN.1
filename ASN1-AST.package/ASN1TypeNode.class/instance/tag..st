accessing
tag: anObject
self halt.
	anObject ifNil: [ self halt ].
	self propertyAt: #tag put: anObject