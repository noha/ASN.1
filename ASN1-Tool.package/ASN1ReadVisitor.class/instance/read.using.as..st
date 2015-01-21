as yet unclassified
read: anEncodedType using: aType as: aClass
	aClass ifNotNil: [  
		fieldFactories at: aType put: aClass ].
	^ self 
		push: anEncodedType
		during: [ self visit: aType ]