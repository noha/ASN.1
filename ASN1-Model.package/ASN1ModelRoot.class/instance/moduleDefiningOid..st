as yet unclassified
moduleDefiningOid: anOidOrString
	^ self modules
		detect: [:each| each definesOid: anOidOrString asAsn1Oid ]
		ifNone: [ nil ]