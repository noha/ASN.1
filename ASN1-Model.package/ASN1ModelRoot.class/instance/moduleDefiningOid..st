accessing
moduleDefiningOid: anOidOrString
	| oid |
	oid := anOidOrString asAsn1Oid.
	^ modules
		detect: [:each| each definesOid: oid ]
		ifNone: [ nil ]