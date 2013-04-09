as yet unclassified
read: anEncodedType using: aType
	^ self 
		push: anEncodedType
		during: [ self visit: aType ]