visiting
visitCollection: aCollection 
	self visitObject: aCollection.
	aCollection elements isNil ifTrue: [ ^nil ].
	^ aCollection elements collect: [:each|
		self visit: each ]