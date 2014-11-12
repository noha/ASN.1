as yet unclassified
moduleNamed: aString 
	libraries do: [ :library |
		(library includesModuleNamed: aString) ifTrue: [ 
			^ library moduleNamed: aString ] ].
	NotFound signal: 'Cannot find module named ', aString asString