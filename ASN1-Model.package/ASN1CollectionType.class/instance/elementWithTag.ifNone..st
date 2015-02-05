as yet unclassified
elementWithTag: aTag ifNone: aBlock
	elements associationsDo: [ :each | 
		(each value tag = aTag) ifTrue: [ ^ each ]  ].
	aBlock value