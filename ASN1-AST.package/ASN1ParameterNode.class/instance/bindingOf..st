binding
bindingOf: aString
	^ (reference label = aString) 
		ifTrue: [ type ]
		ifFalse: [ nil ]