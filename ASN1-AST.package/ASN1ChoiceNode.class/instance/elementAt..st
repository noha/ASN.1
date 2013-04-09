as yet unclassified
elementAt: aString
	^ elements 
		detect: [:each| each name = aString ]
		ifNone: [ nil ]