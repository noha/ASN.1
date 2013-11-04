testing
includesTag: aTag
	^ (self elements 
		detect: [:each| each includesTag: aTag ]
		ifNone: [ nil ]) notNil