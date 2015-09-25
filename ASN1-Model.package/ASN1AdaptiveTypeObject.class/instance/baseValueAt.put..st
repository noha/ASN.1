accessing
baseValueAt: aString put: anObject
	^ self 
		expandFieldNamed: aString
		type: (self basicTypeAt: aString)
		baseValue: anObject