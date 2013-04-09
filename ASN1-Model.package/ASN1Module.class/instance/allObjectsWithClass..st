accessing
allObjectsWithClass: aString
	^ self allObjects select: [:each| each clazz = aString]