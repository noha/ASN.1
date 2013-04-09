visiting
visitAll: aCollection
	aCollection isNil ifTrue: [ ^ aCollection ].
	^ aCollection collect: [:each|
		self visit: each ]