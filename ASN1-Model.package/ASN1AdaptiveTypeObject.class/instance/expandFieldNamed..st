accessing
expandFieldNamed: aFieldName
	^ self 
		expandFieldNamed: aFieldName 
		type: (self basicTypeAt: aFieldName) 