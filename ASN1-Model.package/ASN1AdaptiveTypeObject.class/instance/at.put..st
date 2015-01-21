accessing
at: aKey put: anObject

	type elementAt: aKey ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	anObject ifNil: [ ^ anObject ].
	^ map at: aKey put: anObject