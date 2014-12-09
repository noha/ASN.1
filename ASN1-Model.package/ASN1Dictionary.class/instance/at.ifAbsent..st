accessing
at: anObject ifAbsent: aBlock
	^ (self at: anObject) ifNil: aBlock