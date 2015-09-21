accessing
at: aKey put: anObject
	| typeForKey |
	typeForKey := type elementAt: aKey ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	anObject ifNil: [ ^ anObject ].
	(anObject isAsn1)
		ifTrue: [ map at: aKey put: anObject ]
		ifFalse: [ (self expandFieldNamed: aKey type: typeForKey) basicValue: anObject ].
	^ anObject