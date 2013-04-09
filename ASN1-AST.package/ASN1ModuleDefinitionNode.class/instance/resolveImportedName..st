as yet unclassified
resolveImportedName: aString
	self imports do: [:import|
		import symbols do: [:symbol|
			(symbol label = aString) ifTrue: [
				^ symbol propertyAt: #definition ]]].
	^ nil