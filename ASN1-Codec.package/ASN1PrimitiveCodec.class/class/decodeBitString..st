decoding
decodeBitString: aCollection
	"bits of all octets are concatenated to get the numerical value. The first octet gives the amount of unused bits in the last octet and is not
	part of the resulting number "
	| unusedBits stream |
	"first octet contains number of unused bits"
	unusedBits := aCollection first  asInteger .
	
	"alloc the complete write buffer for the stream. A bit string is 8 times a byte. The
	first octet is skipped"
	stream := WriteStream on: ( String new: (( aCollection size - 1) *8 )  - unusedBits ).
	
	"skip the first (unused bits) octet and the last because on unused bits it needs to
	be handled different"
	aCollection allButFirst allButLast do: [:each|
		stream nextPutAll: ((each asInteger printStringBase: 2) forceTo: 8 paddingStartWith: $0)  ].
		
	stream nextPutAll: ((
		(aCollection last asInteger bitShift: unusedBits negated) 
			printStringBase: 2)
					forceTo: (8 - unusedBits) paddingStartWith: $0).
	^ stream contents