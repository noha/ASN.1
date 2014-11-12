as yet unclassified
includesLibrary: aString 
	^ libraries anySatisfy: [ :each | each name = aString ]