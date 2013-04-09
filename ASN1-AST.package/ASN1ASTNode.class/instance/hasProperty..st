testing
hasProperty: aString
	^ (self properties at: aString ifAbsent: [ nil ]) notNil