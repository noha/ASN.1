*asn1-syntax
isWhiteSpace
	value = 32 ifTrue: [^true].	"space"
	value = 9 ifTrue: [^true].	"tab"
	^false