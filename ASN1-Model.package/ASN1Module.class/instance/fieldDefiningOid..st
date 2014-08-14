accessing
fieldDefiningOid: anOid
	self fields associationsDo: [:each |
			each value = anOid
				ifTrue: [^each]].
	^nil	