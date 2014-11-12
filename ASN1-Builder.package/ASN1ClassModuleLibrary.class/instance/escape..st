as yet unclassified
escape: aString
	^ aString select: [:each| each asciiValue between: 0 and: 127]