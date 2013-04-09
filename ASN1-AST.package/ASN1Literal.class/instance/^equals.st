as yet unclassified
= aLiteral
	(self class = aLiteral class) ifFalse: [ ^ false ].
	^ string = aLiteral string