testing
at: aKey
	^ decoded 
		ifNotNil: [ decoded at: aKey ]
		ifNil: [ nil ]