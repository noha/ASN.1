encoding
encodeInteger: anInteger
	"integers are encoded as 2-complement value. All octets form a bit pattern which resolves the numerical value. Leftmost bit denotes the
	2-complement"
	| value |
	"if the integer is zero we do not need to calculate"
	anInteger = 0 ifTrue: [ ^ #[ 0 ] ].
	anInteger < 0 
		ifTrue: [ 
			"find the highest number (only highest bit set) for the amount of bits in the integer and 
			add it to the value. This gives the 2-complement for negative numbers, e.g. -1 + 128 = 127"
			value := anInteger + (256 raisedTo: ((anInteger negated log: 256)) floor + 1)  ]
		ifFalse: [ value := anInteger ].
	"write the number as octets with LSB at collection index 1 and MSB at collection size"
	^ (ByteArray streamContents: [:stream|
		[ value > 16rff ] whileTrue: [
			stream nextPut: (value bitAnd: 16rff).
			value := value bitShift: -8 ].
		stream nextPut: value]).
	