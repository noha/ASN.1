accessing
fieldAt: aString
	^ (fields detect: [:each|
		each name label = aString ]) type