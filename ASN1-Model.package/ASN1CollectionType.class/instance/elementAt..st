as yet unclassified
elementAt: aString
	^ self elements detect: [:each| 
		each isAsn1Association and: [ each key = aString ] ]