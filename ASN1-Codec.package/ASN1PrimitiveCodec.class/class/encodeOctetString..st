encoding
encodeOctetString: anOctetString
	"an octet string maps 1:1 from data to stream. If the number of hex digits is odd a
	zero is padded to the left in order to produce proper byte values"
	| collection |
	collection := ByteArray readHexFrom: (anOctetString size even 
		ifTrue: [ anOctetString ]
		ifFalse: [ anOctetString copyWithFirst: $0 ]).
	^ collection