Class {
	#name : #ASN1UTF8StringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1UTF8StringType class >> decode: aByteArray [
	^aByteArray asString convertFromEncoding: 'utf-8'
]

{ #category : #codec }
ASN1UTF8StringType class >> encode: aString [
	^(aString convertToEncoding: 'utf-8') asByteArray 
]

{ #category : #accessing }
ASN1UTF8StringType class >> universalType [
	^ 'UTF8String'
]

{ #category : #'as yet unclassified' }
ASN1UTF8StringType >> accept: aVisitor [
	^ aVisitor visitPrintableString: self
]
