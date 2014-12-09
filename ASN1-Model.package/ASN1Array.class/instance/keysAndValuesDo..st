as yet unclassified
keysAndValuesDo: aBlock
	collection do: [:each|
		aBlock value: each key value: each value ]