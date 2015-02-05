as yet unclassified
visitCollection: aCollection 

	^ aCollection elements associations collect: [:each|
		(each key = key) ifTrue: [ objects add: each value ].
		self visit: each value ]