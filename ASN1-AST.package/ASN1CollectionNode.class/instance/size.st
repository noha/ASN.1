accessing
size
	^ elements isNil
		ifTrue: [ 0 ]
		ifFalse: [ elements size ]