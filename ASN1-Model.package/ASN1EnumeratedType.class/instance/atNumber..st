as yet unclassified
atNumber: aNumber
	^ elements
		detect: [:each| 
			each isAsn1Node and: [ each number = aNumber ]]
		ifNone: [ nil ]