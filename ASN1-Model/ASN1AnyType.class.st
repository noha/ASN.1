Class {
	#name : #ASN1AnyType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1AnyType class >> universalType [
	^ 'ANY TYPE'
]

{ #category : #visiting }
ASN1AnyType >> accept: aVisitor [ 
	 ^ aVisitor visitAnyType: self
]

{ #category : #'as yet unclassified' }
ASN1AnyType >> includesTag: aTag [
	^ true
]
