as yet unclassified
bindingNamed: aString
	types
		at: aString
		ifPresent:[ :v | ^ aString -> v ].
	^ super bindingNamed: aString