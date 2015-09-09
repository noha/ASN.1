testing
includesTag: aTag
	^ (self elements 
		detect: [:each| each value includesTag: aTag ]
		ifNone: [ nil ]) notNil