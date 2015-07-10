reading
readMultipleOctetsWithHighBitSet: aStream	
	| octet val |
	val := 0.
	[ 	octet := self nextFrom: aStream.
		val := ((val bitShift: 7) bitOr: (octet asInteger bitAnd: 127)).
		(octet asInteger bitAnd: 128) = 128
	] whileTrue.
	^ val