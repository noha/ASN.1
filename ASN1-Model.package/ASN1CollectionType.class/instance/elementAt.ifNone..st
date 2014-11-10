as yet unclassified
elementAt: aString ifNone: aBlock
	^ self elements 
		detect: [:each| each isAsn1Association and: [ each key = aString ] ]
		ifNone: aBlock