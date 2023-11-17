codec
encode: anInteger
	| value bytesNeeded highBitValue |
	"Encode a signed value to a two's complement byte representation. As we don't know
	the number of bytes to encode to we need to calculate the least number of needed 
	bytes to encode the value"
	bytesNeeded := anInteger bytesCount.

	"If anInteger is not within the value range of the two's complement value
	we need an additional byte to store the value"
	highBitValue := 2 raisedTo: 8 * bytesNeeded - 1.
	(anInteger between: highBitValue negated and: highBitValue - 1)
		ifFalse: [ bytesNeeded := bytesNeeded + 1 ].

	"If anInteger is negative we need to add the value of the highest bit to get
	the correct bit representation for the two's complement"
	value := anInteger positive
		ifTrue: [ anInteger ]
		ifFalse: [ anInteger + (2 raisedTo: bytesNeeded * 8) ].
	"Make sure the byte array is of correct size. Values can have a zero high byte so we
	pad to the right size"
	^ value asByteArrayOfSize: bytesNeeded