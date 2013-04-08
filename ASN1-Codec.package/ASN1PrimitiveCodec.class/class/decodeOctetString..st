decoding
decodeOctetString: aCollection
	"each octets numerical value will be converted into a corresponding string padded with zeros if necessary"
	| string |
	string := String streamContents: [:stream|
		aCollection do: [:each|
			stream nextPutAll: ((each asInteger printStringBase: 16) forceTo: 2 paddingStartWith: $0) ]].
	^ ((aCollection last bitAnd: 15) = 0) 
		ifTrue: [ string allButLast ]
		ifFalse: [ string ]