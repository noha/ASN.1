as yet unclassified
visitAll: aCollection
	aCollection isNil ifTrue: [ ^ nil ].
	^ aCollection collect: [:each|
		self visit: each ]
	