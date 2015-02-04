as yet unclassified
read: anEncodedType using: aType as: aClass

	^ self 
		push: anEncodedType
		during: [ self visit: aType ]