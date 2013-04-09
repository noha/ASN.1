*asn1-tool
decodeExplicit: anObject
	^ self isExplicitlyTagged 
		ifTrue: [ anObject firstElement ]
		ifFalse: [ anObject ]