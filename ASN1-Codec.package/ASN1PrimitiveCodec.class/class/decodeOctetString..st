decoding
decodeOctetString: aCollection
	"convert bytes 1:1 into a string. A zero digit to the left is skipped"
	| string |
	aCollection ifEmpty: [ ^ '' ].
	string := aCollection asByteArray hex asUppercase.
	^ (string first = $0) 
		ifTrue: [ string allButFirst ]
		ifFalse: [  string ]