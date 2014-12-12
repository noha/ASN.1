as yet unclassified
respondsTo: aSymbol
	(aSymbol isUnary and: [ map includesKey: aSymbol asString ]) ifTrue: [ ^ true ].
	^ super respondsTo: aSymbol 