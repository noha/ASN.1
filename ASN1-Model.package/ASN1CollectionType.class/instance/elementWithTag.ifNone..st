as yet unclassified
elementWithTag: aTag ifNone: aBlock
	^ self  elements 
		detect: [:each| each value tag = aTag ]
		ifNone: aBlock