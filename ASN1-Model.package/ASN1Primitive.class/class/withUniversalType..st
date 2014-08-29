accessing
withUniversalType: aString 
	^ self allSubclasses 
		detect: [ :cls | cls universalType = aString ]
		