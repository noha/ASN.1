Class {
	#name : #ASN1OctetStringValue,
	#superclass : #ASN1PrimitiveValue,
	#category : 'ASN1-Model'
}

{ #category : #comparing }
ASN1OctetStringValue >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ contents = anObject stringValue
]

{ #category : #visiting }
ASN1OctetStringValue >> accept: aVisitor [
	^ aVisitor visitOctetStringValue: self
]

{ #category : #converting }
ASN1OctetStringValue >> asAsn1HexString [
	^ contents asAsn1HexString
]

{ #category : #converting }
ASN1OctetStringValue >> asByteArray [
	^ contents asByteArray
]

{ #category : #converting }
ASN1OctetStringValue >> asInteger [
	^ contents asInteger
]

{ #category : #accessing }
ASN1OctetStringValue >> byteSize [
	^ contents size
]

{ #category : #accessing }
ASN1OctetStringValue >> contents: aByteArray [
	"(aByteArray class = ByteArray) ifFalse: [ 
		Error signal: 'contents for octet string needs to be a byte array' ]."
	super contents: aByteArray 
]

{ #category : #comparing }
ASN1OctetStringValue >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ contents hash
]

{ #category : #converting }
ASN1OctetStringValue >> hex [
	^ contents hex
]

{ #category : #accessing }
ASN1OctetStringValue >> stringValue [
	^ contents
]
