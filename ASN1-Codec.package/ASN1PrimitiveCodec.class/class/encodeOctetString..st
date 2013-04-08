encoding
encodeOctetString: anOctetString
	"an octet string maps 1:1 from data to stream"
	| collection |
	collection := ByteArray readHexFrom: anOctetString.
	anOctetString size even ifFalse: [
		collection := (collection asOrderedCollection 
			add: (('123456789abcdef' indexOf: anOctetString last asLowercase) bitShift: 4); 
			yourself ) 
		asByteArray ].
	^ collection