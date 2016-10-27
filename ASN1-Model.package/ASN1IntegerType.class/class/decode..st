codec
decode: aCollection
	| value |
	"Decode a ByteArray to a two's complement value. The first byte has the
	MSB/sign bit. Last byte contains bit 0"
	
	"Ignore sign bit and set the value of the remaining 7 bits"
	value := aCollection first bitAnd: 16r7f.
	
	"Every subsequent octet is added directly to the value"
	(aCollection size > 1) ifTrue: [  
		2 to: aCollection size do: [ :each |
			value := value bitShift: 8.
			value := value bitOr: (aCollection at: each) ]].
	
	"Check the sign bit and if set subtract the value of the highest
	bit to get two's complement value"
	((aCollection first bitAnd: 16r80) > 0) ifTrue: [ 
		value := value - (2 raisedTo: ((aCollection size * 8) - 1)) ].
	^ value