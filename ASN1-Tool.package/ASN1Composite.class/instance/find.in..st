as yet unclassified
find: aKey in: aCollection
	aCollection do: [:each|
		each isAsn1Composite ifTrue: [
			(each basicFind: aKey) ifNotNil: [:elem|
				^ elem ]]].
	^ nil