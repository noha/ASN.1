*asn1-syntax
isWhiteSpace
	self asciiValue = 32 ifTrue: [^true].	"space"
	self asciiValue = 9 ifTrue: [^true].	"tab"
	^false