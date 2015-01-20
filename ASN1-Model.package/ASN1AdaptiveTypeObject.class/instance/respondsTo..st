class membership
respondsTo: aSymbol
	(aSymbol isUnary and: [ map includesKey: aSymbol asString ]) ifTrue: [ ^ true ].
	^ super respondsTo: aSymbol 