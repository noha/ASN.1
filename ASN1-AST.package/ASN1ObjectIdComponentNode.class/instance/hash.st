comparing
hash
	(self name notNil) ifTrue: [
		^ self name hash].
	^ self number hash