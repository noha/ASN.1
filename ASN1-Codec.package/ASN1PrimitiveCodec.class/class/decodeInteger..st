decoding
decodeInteger: aCollection
	"integers are encoded as 2-complement value. All octets form a bit pattern which resolves the numerical value. 
	Leftmost bit denotes the 2-complement"
	| integer |
	integer := 0.
	"add the last (MSB) octet without the highest bit which denotes negative sign"
	integer := integer bitOr: (aCollection last bitAnd: 127).
	"for the rest of the collection add them byte by byte in order to the number"
	aCollection allButLast reverse do: [ :octet |
		 integer := (integer bitShift: 8 ) bitOr: octet ].
	"on negative number we need to subtract the number with the highest bit set to value
	to get the result. E.g. 127 - 128 = -1"
	(aCollection last > 127)
		ifTrue: [ 
			integer := integer - (2 raisedTo: (aCollection size * 8) -1 )].
	^ integer