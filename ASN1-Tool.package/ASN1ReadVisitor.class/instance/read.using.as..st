as yet unclassified
read: anEncodedType using: aType as: aClass
	aClass ifNotNil: [  
		factories at: aType put: aClass ].
	^ self 
		push: anEncodedType
		during: [ self visit: aType ]