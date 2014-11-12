accessing
moduleDefiningOid: anOidOrString
	| oid |
	oid := anOidOrString asAsn1Oid.
	^ self modules
		detect: [:each| each definesOid: oid ]
		ifNone: [ nil ]