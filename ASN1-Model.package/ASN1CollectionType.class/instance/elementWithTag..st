as yet unclassified
elementWithTag: aTag
	^ self elementWithTag: aTag ifNone: [ NotFound signal ]