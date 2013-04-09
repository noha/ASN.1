as yet unclassified
components: aCollection
	(aCollection last isNumber) ifTrue: [ self halt ].
	^ self new
		components: aCollection