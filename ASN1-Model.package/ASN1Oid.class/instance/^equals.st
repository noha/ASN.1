comparing
= anOid
	(anOid class = self class) ifFalse: [  ^ false ].
	^ anOid hasSameValue: value