accessing
contents: anObject
	anObject isAsn1 ifTrue: [ Error signal: 'cannot use ASN.1 object as contents' ].
	contents := anObject