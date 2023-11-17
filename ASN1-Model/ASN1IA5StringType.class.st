Class {
	#name : #ASN1IA5StringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1IA5StringType class >> decode: anObject [
	^anObject asString
]

{ #category : #codec }
ASN1IA5StringType class >> encode: anObject [
	^anObject asByteArray
]

{ #category : #accessing }
ASN1IA5StringType class >> universalType [
	^ 'IA5String'
]

{ #category : #'as yet unclassified' }
ASN1IA5StringType >> accept: aVisitor [
	^ aVisitor visitIA5StringType: self
]
