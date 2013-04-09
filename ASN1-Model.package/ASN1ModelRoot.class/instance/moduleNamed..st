accessing
moduleNamed: aString
	^ modules detect: [:each| each name = aString ]