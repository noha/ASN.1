as yet unclassified
push: anObject during: aBlock
	| result |
	stack push: anObject.
	[ result := aBlock value ]
		ensure: [ stack pop ].
	^ result