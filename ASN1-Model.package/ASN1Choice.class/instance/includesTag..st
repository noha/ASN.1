testing
includesTag: aTag
	((self tag notNil) and: [ self tag = aTag])
		ifTrue: [ ^ true ].
	^ (self elements 
		detect: [:each| each includesTag: aTag ]
		ifNone: [ nil ]) notNil