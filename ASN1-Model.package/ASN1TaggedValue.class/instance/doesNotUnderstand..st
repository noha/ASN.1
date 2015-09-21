error handling
doesNotUnderstand: aMessage
	"delegate method calls to value but prevent accidentially unwrapping types. When
	we get back the wrapped type we assume we can return self"
	| returnValue |
	returnValue := aMessage sendTo: value.
	^ (returnValue = value) 
		ifTrue: [ self ]
		ifFalse: [ returnValue ]