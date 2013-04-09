as yet unclassified
visitObject: anObject
	anObject tag ifNotNil: [:tag|
		((tag tagClass = tagClass) and: [ tag tagNumber = tagNumber ])
			ifTrue: [ object := anObject ] ]