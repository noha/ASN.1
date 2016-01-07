testing
hasBitNamed: aString 
	^ (self namedBits
		detect: [ :each | each name = aString ]
		ifNone: [  nil  ]) notNil