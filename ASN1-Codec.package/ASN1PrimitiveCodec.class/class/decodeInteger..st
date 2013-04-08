decoding
decodeInteger: aCollection
	"integers are encoded as 2-complement value. All octets form a bit pattern which resolves the numerical value. Leftmost bit denotes the
	2-complement"
	| complement int |
	complement := aCollection first asInteger bitAnd: 128.
	int := aCollection first asInteger bitAnd: 127.
	2 to: aCollection size do: [:each|
		int := (int bitShift: 8) bitOr: each asInteger ].
	 (complement > 0) ifTrue: [
		int := int - (2 raisedTo: (aCollection size * 8))].
	^ int