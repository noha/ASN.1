as yet unclassified
removeKey: anObject
	| index |
	index := keys indexOf: anObject.
	(index > 0)
		ifTrue: [ 
			keys removeAt: index.
			values removeAt: index  ]