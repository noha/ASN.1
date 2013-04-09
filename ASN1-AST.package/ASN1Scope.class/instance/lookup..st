resolving
lookup: aString
	^ self 
		lookup: aString 
		ifAbsent: [ Error signal: 'couldn''t find declaration of ', aString printString ]