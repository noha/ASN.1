Class {
	#name : #ASN1NumericStringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1NumericStringType class >> decode: aCollection [
	^ aCollection asString
]

{ #category : #codec }
ASN1NumericStringType class >> encode: aString [
	^ aString asByteArray
]

{ #category : #accessing }
ASN1NumericStringType class >> universalType [
	^ 'NumericString'
]

{ #category : #'as yet unclassified' }
ASN1NumericStringType >> accept: aVisitor [
	aVisitor visitNumericStringType: self
]
