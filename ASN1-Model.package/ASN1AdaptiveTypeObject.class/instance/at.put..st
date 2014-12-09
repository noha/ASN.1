accessing
at: aKey put: anObject

	type elementAt: aKey ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	"(self basicTypeAt: aKey) validateValue: anObject."
	^ map at: aKey put: anObject