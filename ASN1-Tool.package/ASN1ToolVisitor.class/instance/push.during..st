as yet unclassified
push: anObject during: aBlock
	| result |
	anObject ifNil: [  Error signal: 'cannot push nil onto stack' ].
	stack push: anObject.
	[ result := aBlock value ]
		ensure: [ stack pop ].
	^ result