as yet unclassified
addMapKey: aString value: anObject to: reader 
	(anObject valueMapAt: aString) ifNotNil: [ :fieldValue |
		reader valueMapAt: self put: fieldValue ]