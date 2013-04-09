testing
includesTag: aTag
	((self explicitTag notNil) and: [ self explicitTag = aTag])
		ifTrue: [ ^ true ].
	^ (self elements 
		detect: [:each| each includesTag: aTag ]
		ifNone: [ nil ]) notNil