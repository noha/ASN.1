accessing
propertyAt: aString 
	^ self properties at: aString ifAbsent: [ nil ]