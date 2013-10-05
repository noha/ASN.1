as yet unclassified
atName: aString
	^ elements
		detect: [:each| each name = aString ]
		ifNone: [ nil ]