resolving
bindingOf: aString
	^ namedNumbers ifNotNil: [ 
		 namedNumbers
			detect: [ :each | each name = aString ]
			ifNone: [ nil ] ]