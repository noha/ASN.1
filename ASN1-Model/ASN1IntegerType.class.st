Class {
	#name : #ASN1IntegerType,
	#superclass : #ASN1PrimitiveType,
	#instVars : [
		'namedNumbers'
	],
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1IntegerType class >> decode: aCollection [
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
]

{ #category : #codec }
ASN1IntegerType class >> encode: anInteger [
	| value bytesNeeded highBitValue |
	"Encode a signed value to a two's complement byte representation. As we don't know
	the number of bytes to encode to we need to calculate the least number of needed 
	bytes to encode the value"
	bytesNeeded := anInteger bytesCount.

	"If anInteger is not within the value range of the two's complement value
	we need an additional byte to store the value"
	highBitValue := 2 raisedTo: 8 * bytesNeeded - 1.
	(anInteger between: highBitValue negated and: highBitValue - 1)
		ifFalse: [ bytesNeeded := bytesNeeded + 1 ].

	"If anInteger is negative we need to add the value of the highest bit to get
	the correct bit representation for the two's complement"
	value := anInteger positive
		ifTrue: [ anInteger ]
		ifFalse: [ anInteger + (2 raisedTo: bytesNeeded * 8) ].
	"Make sure the byte array is of correct size. Values can have a zero high byte so we
	pad to the right size"
	^ value asByteArrayOfSize: bytesNeeded
]

{ #category : #accessing }
ASN1IntegerType class >> universalType [
	^ 'INTEGER'
]

{ #category : #visiting }
ASN1IntegerType >> accept: aVisitor [ 
	^ aVisitor visitIntegerType: self
]

{ #category : #validating }
ASN1IntegerType >> acceptsValue: anObject [ 
	^ anObject isNumber
]

{ #category : #accessing }
ASN1IntegerType >> asn1ValueClass [
	^ ASN1IntegerValue 
]

{ #category : #accessing }
ASN1IntegerType >> namedNumbers [
	^ namedNumbers
]

{ #category : #accessing }
ASN1IntegerType >> namedNumbers: aCollection [
	namedNumbers := aCollection
]
