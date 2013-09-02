as yet unclassified
moduleDefiningOid: anOidOrString
	^ self modules
		detect: [:each| each definesOid: anOidOrString value]
		ifNone: [ nil ]