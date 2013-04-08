decoding
decodeBitString: aCollection
	"bits of all octets are concatenated to get the numerical value. The first octet gives the amount of unused bits in the last octet and is not
	part of the resulting number "
	| value unusedBits |
	unusedBits := aCollection first asInteger .
	^ String streamContents: [:stream|
		2 to: (aCollection size - 1) do: [:each|
			stream nextPutAll: ((each asInteger printStringBase: 2) forceTo: 8 paddingStartWith: $0)  ].
		stream nextPutAll: ((
			(aCollection last asInteger bitShift: unusedBits negated) 
				printStringBase: 2)
					forceTo: (8 - unusedBits) paddingStartWith: $0 ) ]