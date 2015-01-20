accessing
at: aKey put: anObject

	type elementAt: aKey ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	^ map at: aKey put: anObject