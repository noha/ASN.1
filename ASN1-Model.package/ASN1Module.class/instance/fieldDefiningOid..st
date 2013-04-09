accessing
fieldDefiningOid: aString 
	^ self fields associations
			detect: [:each| each value definesOid: aString ]
			ifNone: [ nil ]