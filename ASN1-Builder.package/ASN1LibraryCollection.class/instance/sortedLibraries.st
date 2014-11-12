as yet unclassified
sortedLibraries
	^ libraries sort: [ :a :b |  
		(b dependencies includes: a name) ]