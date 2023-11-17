Class {
	#name : #ASN1IntegerValue,
	#superclass : #ASN1PrimitiveValue,
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1IntegerValue >> accept: aVisitor [
	^ aVisitor visitIntegerValue: self 
]

{ #category : #testing }
ASN1IntegerValue >> isZero [
	^ contents isZero
]
