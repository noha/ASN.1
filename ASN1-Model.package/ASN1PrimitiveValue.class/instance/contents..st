accessing
contents: anObject
	anObject isAsn1 ifTrue: [ self halt ].
	contents := anObject