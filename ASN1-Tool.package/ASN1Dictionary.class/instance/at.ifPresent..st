accessing
at: anObject ifPresent: aBlock
	^ (self at: anObject) ifNotNil: aBlock