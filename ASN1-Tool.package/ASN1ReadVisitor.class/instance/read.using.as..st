as yet unclassified
read: anEncodedType using: aType as: aClass
	aClass ifNotNil: [  
		valueMap at: aType put: aClass new ].
	^ self 
		push: anEncodedType
		during: [ self visit: aType ]