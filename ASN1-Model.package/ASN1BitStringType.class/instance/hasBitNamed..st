testing
hasBitNamed: aString 
	^ (self bits
		detect: [ :each | each name = aString ]
		ifNone: [  nil  ]) notNil