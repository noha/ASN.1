accessing
type: anObject
	self flag: #needsCheck.
	type := (anObject isNil)
		ifTrue: [ ASN1OpenTypeNode new ]
		ifFalse: [ anObject ]