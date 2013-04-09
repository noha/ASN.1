as yet unclassified
elementWithTag: aTag
	^ self  elements 
		detect: [:each| each value tag = aTag ]