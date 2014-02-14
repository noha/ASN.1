as yet unclassified
elementWithTag: aTag
	^ (self  elements reject: #isExtension)
		detect: [:each| each value tag = aTag ]