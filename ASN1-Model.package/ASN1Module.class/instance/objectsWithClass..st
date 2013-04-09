accessing
objectsWithClass: aString
	^ self fields select: [:each|
		each isAsn1Object and: [ each clazz = aString]]