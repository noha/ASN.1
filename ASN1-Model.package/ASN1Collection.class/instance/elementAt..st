as yet unclassified
elementAt: aString
	^ self elements detect: [:each| each key = aString ]