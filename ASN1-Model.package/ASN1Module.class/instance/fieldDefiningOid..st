accessing
fieldDefiningOid: anOid
	^ self fields associations
			detect: [:each| each value = anOid ]
			ifNone: [ nil ]