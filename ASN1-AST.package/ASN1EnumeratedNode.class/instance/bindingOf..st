as yet unclassified
bindingOf: aString
	^ self elements 
		detect: [ :each | each name = aString ]
		ifNone: [  nil ]