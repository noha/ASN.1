finding
find: aKey in: aCollection
	aCollection do: [:each|
		each isAsn1Composite ifTrue: [
			(each basicFind: aKey) ifNotNil: [:elem|
				^ elem ]]].
	^ nil