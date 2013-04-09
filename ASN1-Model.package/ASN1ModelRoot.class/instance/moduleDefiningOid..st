as yet unclassified
moduleDefiningOid: aString
	^ self modules
		detect: [:each| each definesOid: aString ]
		ifNone: [ nil ]