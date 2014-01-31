decoding
encodeBitString: anObject
	"encode an 8-padded bytearray for the bits in the bit string. The first octet contains
	the number of unused bits. "
	| unusedBits octets stream octet |
	octets := OrderedCollection new.
	unusedBits := (8 - (anObject size \\ 8) \\ 8).
	octets add: unusedBits.
	stream := anObject readStream.
	octet := 0.
	"write from leading to trailing bit. The leading bit is the left most (most significant)
	bit of the first content octet in the result"
	[ stream atEnd ] whileFalse: [ 
		octet := octet bitOr: stream next digitValue.
		((stream position \\ 8) = 0) ifTrue: [
			octets add: octet.
			octet := 0 ].
		octet := octet bitShift: 1 ].
	"if the string is not a multiple of 8 it has unused bits"
	(unusedBits = 0) ifFalse: [  
		octets add: (octet bitShift: (unusedBits - 1)) ].
	^ octets asByteArray 