Class {
	#name : #ASN1BitStringValue,
	#superclass : #ASN1PrimitiveValue,
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1BitStringValue >> accept: aVisitor [
	^ aVisitor visitBitStringValue: self
]

{ #category : #adding }
ASN1BitStringValue >> addNamedBit: aString [
	"add a single named bit to the binary string representation. "
	| index |
	(self type hasBitNamed: aString) ifFalse: [ Error signal: 'not a valid bit name for this type' ].
	index := (self type indexOfBitNamed: aString) + 1.
	"the bit name is checked therefor the index lays between 0 and named bits size. The actual contents
	string could be shorter than the amount of named bits. So we adjust it first before trying to set a
	value a the given index position"
	( index < self contents size ) ifFalse: [ 
		self adjustContentsSize ].
	contents at: index put: $1 	
]

{ #category : #converting }
ASN1BitStringValue >> adjustContentsSize [
	"adjust the size of the binary string representation to the amount of named
	bits available"
	(self type namedBits size > self contents size) ifTrue: [  
		contents := String streamContents: [ :stream | 
			stream nextPutAll: contents.
			self contents size + 1 to: self type namedBits size do: [ :n |
				stream nextPut: $0 ] ] ]
]

{ #category : #converting }
ASN1BitStringValue >> adjustContentsSize: aNumber [
	"adjust the size of the binary string representation to aNumber size"
	contents := String streamContents: [ :stream | 
		stream nextPutAll: contents.
		aNumber timesRepeat: [ stream nextPut: $0 ] ]
]

{ #category : #testing }
ASN1BitStringValue >> allBitsAreSet [
	^ (self namedBits difference: self type bitNames ) isEmpty
]

{ #category : #testing }
ASN1BitStringValue >> bitEquals: anArray [ 
	^ (self namedBits difference: anArray) isEmpty
]

{ #category : #accessing }
ASN1BitStringValue >> contents [
	^ contents ifNil: [ 
		contents := '' ]
]

{ #category : #accessing }
ASN1BitStringValue >> contents: aCollectionOrString [
	"enable the setting for the bit string either as binary string or as collection of
	bit names."
	aCollectionOrString isString 
		ifTrue: [ 
			contents := aCollectionOrString.
			self adjustContentsSize ]
		ifFalse: [ self namedBits: aCollectionOrString ]
	
]

{ #category : #testing }
ASN1BitStringValue >> includesBit: aString [ 
	^ self namedBits includes: aString
]

{ #category : #accessing }
ASN1BitStringValue >> indexOfBitNamed: aByteString [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
ASN1BitStringValue >> namedBits [
	"decode binary contents into there named counterparts"
	| namedBits |
	contents ifNil: [ ^ #() ].
	namedBits := OrderedCollection new.
	contents withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
		 	namedBits add: (self type bitNameAtIndex: index - 1) ]].
	^ namedBits
]

{ #category : #accessing }
ASN1BitStringValue >> namedBits: aCollection [
	"encode aCollection of named bits into there binary string representation. Bits need to be
	kept in binary form because there can be bit strings without named bits"
	| number |
	number := 0.
	(type bitNames includesAll: aCollection) ifFalse: [ 
			Error signal: 'bit string does not understand bit names: ', (aCollection difference: type bitNames) asString  ].		

	aCollection do: [ :each|
		number := number bitOr: (1 bitShift: (self type indexOfBitNamed: each)) ].
	contents := (number printStringBase: 2 length: type namedBits size padded: true) reversed
]

{ #category : #printing }
ASN1BitStringValue >> printOn: aStream [
	self type numberOfBits isZero
		ifTrue: [ aStream nextPutAll: '(no named bits)' ]
		ifFalse: [  
			self namedBits 
				do: [ :each | aStream nextPutAll: each ]
				separatedBy: [ aStream nextPut: $, ] ].
	aStream nextPutAll: ' ['.
	type printOn: aStream.
	aStream nextPutAll: ']'
]
