encoding
encodeInteger: anInteger
	"integers are encoded as 2-complement value. All octets form a bit pattern which resolves the numerical value. Leftmost bit denotes the
	2-complement"
	| complement value array |
	anInteger < 0 
		ifTrue: [ 
			complement := 16r80.
			value := anInteger negated ]
		ifFalse: [ complement := 0.
			value := anInteger ].
	^ (ByteArray streamContents: [:stream|
		[ value > 16rff ] whileTrue: [
			stream nextPut: (value bitAnd: 16rff).
			value := value bitShift: -8 ].
		stream nextPut: (value bitOr: complement)]) reversed.
	