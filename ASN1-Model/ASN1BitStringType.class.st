Class {
	#name : #ASN1BitStringType,
	#superclass : #ASN1PrimitiveType,
	#instVars : [
		'namedBits'
	],
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1BitStringType class >> decode: aCollection [
	"bits of all octets are concatenated to get the numerical value. The first octet gives the amount of unused bits in the last octet and is not
	part of the resulting number "
	| unusedBits stream |
	"first octet contains number of unused bits"
	unusedBits := aCollection first  asInteger .
	
	"if the bitstring is empty there is only a zero octet"
	((unusedBits = 0) & (aCollection size = 1)) ifTrue: [ 
		^ '' ].
	
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
]

{ #category : #codec }
ASN1BitStringType class >> encode: anObject [
	"encode an 8-padded bytearray for the bits in the bit string. The first octet contains
	the number of unused bits. "
	| binaryString unusedBits octets stream octet |
	octets := OrderedCollection new.
	"remove zeros on the right because the count into unused bits and are just ignored"
	self flag:#todo. "The above ignores the minimum size of a bit string value!"
	binaryString := anObject "trimRight: [ :c | c = $0 ]".
	unusedBits := (8 - (binaryString size \\ 8) \\ 8).
	octets add: unusedBits.
	stream := binaryString readStream.
	octet := 0.
	"write from leading to trailing bit. The leading bit is the left most (most significant)
	bit of the first content octet in the result"
	[ stream atEnd ] whileFalse: [ 
		octet := octet bitShift: 1.
		octet := octet bitOr: stream next digitValue.
		((stream position \\ 8) = 0) ifTrue: [
			octets add: octet.
			octet := 0 ].
		].
	"if the string is not a multiple of 8 it has unused bits"
	(unusedBits = 0) ifFalse: [  
		octets add: (octet bitShift: unusedBits) ].
	^ octets asByteArray 
]

{ #category : #accessing }
ASN1BitStringType class >> universalType [
	^ 'BIT STRING'
]

{ #category : #visiting }
ASN1BitStringType >> accept: aVisitor [ 
	^ aVisitor visitBitStringType: self 
]

{ #category : #validating }
ASN1BitStringType >> acceptsValue: aByteArray [
	^ aByteArray class == ByteArray
]

{ #category : #accessing }
ASN1BitStringType >> asn1ValueClass [
	^ ASN1BitStringValue 
]

{ #category : #accessing }
ASN1BitStringType >> bitNameAtIndex: aNumber [ 
	^ (self namedBits detect: [ :each | each value = aNumber ]) name
]

{ #category : #accessing }
ASN1BitStringType >> bitNames [
	^ self namedBits collect: #name
]

{ #category : #testing }
ASN1BitStringType >> hasBitNamed: aString [ 
	^ (self namedBits
		detect: [ :each | each name = aString ]
		ifNone: [  nil  ]) notNil
]

{ #category : #accessing }
ASN1BitStringType >> indexOfBitNamed: aString [ 
	^ (self namedBits 
		detect: [ :each | each name = aString ]
		ifNone: [ Error signal: 'cannot find bit named ', aString asString,' in bit string type ', self asString ] ) value
]

{ #category : #accessing }
ASN1BitStringType >> namedBits [
	^ namedBits
]

{ #category : #accessing }
ASN1BitStringType >> namedBits: anArray [
	namedBits := anArray ifNil: [ Array new ]
]

{ #category : #accessing }
ASN1BitStringType >> numberOfBits [
	^ self namedBits size
]

{ #category : #printing }
ASN1BitStringType >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self namedBits 
		do: [ : each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)
]
