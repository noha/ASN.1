as yet unclassified
definitionsFor: aSymbol
	^ ((Pragma allNamed: #definition: in: self class)
		select: [:each| each arguments first = aSymbol ]) 
			collect: [:each| self perform: each method selector ]