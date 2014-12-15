visiting
visitCollection: aCollection 
	self visitObject: aCollection.
	^ aCollection elements collect: [:each|
		self visit: each ]