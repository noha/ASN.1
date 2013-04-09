as yet unclassified
grammar: aSymbol
	^ String streamContents: [:stream|
		stream nextPutAll: (self headFor: aSymbol).
		(self definitionsFor: aSymbol)
			do: [:each| stream nextPutAll: each ]
			separatedBy: [ stream nextPutAll: String lf ].
		stream nextPutAll: (self tailFor: aSymbol) ]