visiting
visit: anObject
	anObject isNil ifTrue: [ ^ nil ].
	^ anObject isAsn1Node 
		ifTrue: [ anObject accept: self ]
		ifFalse: [ anObject ]