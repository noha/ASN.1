as yet unclassified
atNumber: aNumber
	^ self namedElements
		detect: [:each| each number = aNumber ]
		ifNone: [ nil ]