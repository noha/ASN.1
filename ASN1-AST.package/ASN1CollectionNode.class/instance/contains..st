testing
contains: aString
	^ self elements 
		anySatisfy: [:each| each notNil and: [ each contains: aString ]]