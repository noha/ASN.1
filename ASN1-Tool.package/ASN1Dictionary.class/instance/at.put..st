accessing
at: aKey put: anObject
	(keys includes: aKey)
		ifTrue: [ 
			values 
				at: (keys indexOf: aKey ) 
				put: anObject ]
		ifFalse: [
			keys add: aKey.
			values add: anObject ]