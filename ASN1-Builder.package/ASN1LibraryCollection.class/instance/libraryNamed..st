accessing
libraryNamed: aString 
	^ libraries detect: [ :each | each name = aString ]