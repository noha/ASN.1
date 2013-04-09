binding
bindingOf: aString
	self flag: #incomplete.
	^ self fields 
		detect: [:each| each name label = aString ]
		ifNone: [ nil ]