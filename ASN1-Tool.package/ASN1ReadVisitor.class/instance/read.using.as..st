as yet unclassified
read: anEncodedValue using: aType as: aClass

	^ self 
		push: anEncodedValue
		during: [ self visit: aType ]