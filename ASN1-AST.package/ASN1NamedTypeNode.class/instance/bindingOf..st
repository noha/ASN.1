as yet unclassified
bindingOf: aString
	(name = aString) ifTrue: [ ^ self ].
	^ type bindingOf: aString