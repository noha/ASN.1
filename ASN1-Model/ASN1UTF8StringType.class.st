Class {
	#name : #ASN1UTF8StringType,
	#superclass : #ASN1PrimitiveType,
	#category : #'ASN1-Model'
}

{ #category : #codec }
ASN1UTF8StringType class >> decode: aByteArray [
	^aByteArray utf8Decoded
]

{ #category : #codec }
ASN1UTF8StringType class >> encode: aString [
	^ aString utf8Encoded
]

{ #category : #accessing }
ASN1UTF8StringType class >> universalType [
	^ 'UTF8String'
]

{ #category : #'as yet unclassified' }
ASN1UTF8StringType >> accept: aVisitor [
	^ aVisitor visitPrintableString: self
]
