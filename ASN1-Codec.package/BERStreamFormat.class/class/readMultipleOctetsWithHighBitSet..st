as yet unclassified
readMultipleOctetsWithHighBitSet: aStream	
	| octet val |
	val := 0.
	[ 	octet := aStream next.
		octet ifNil: [
			Error signal: 'expected another octet to read'].
		val := ((val bitShift: 7) bitOr: (octet asInteger bitAnd: 127)).
		(octet asInteger bitAnd: 128) = 128
	] whileTrue.
	^ val