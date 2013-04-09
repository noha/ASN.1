resolving
moduleIdentifierNamed: aModuleName
	^ (self modules
		detect: [:each| each identifier name = aModuleName ]
		ifNone: [ ^ nil ]) identifier