decoding
encodeBitString: anObject
	| unusedBits octets stream octet |
	octets := OrderedCollection new.
	unusedBits := 8 - (anObject size \\ 8).
	octets add: unusedBits.
	stream := anObject readStream.
	octet := 0.
	[ stream atEnd ] whileFalse: [ 
		octet := octet bitOr: stream next digitValue.
		((stream position \\ 8) = 0) ifTrue: [
			octets add: octet.
			octet := 0 ].
		octet := octet bitShift: 1 ].
	octets add: (octet bitShift: (unusedBits - 1)) .
	^ octets asByteArray 