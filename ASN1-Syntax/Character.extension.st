Extension { #name : #Character }

{ #category : #'*asn1-syntax' }
Character >> isWhiteSpace [
	self asciiValue = 32 ifTrue: [^true].	"space"
	self asciiValue = 9 ifTrue: [^true].	"tab"
	^false
]
