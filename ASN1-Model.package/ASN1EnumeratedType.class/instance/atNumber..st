as yet unclassified
atNumber: aNumber
	^ elements
		detect: [:each| each number = aNumber ]
		ifNone: [ nil ]