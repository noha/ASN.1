Class {
	#name : #ASN1ExternalValue,
	#superclass : #ASN1PrimitiveValue,
	#instVars : [
		'oid'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ExternalValue >> accept: aVisitor [
	^ aVisitor visitExternalValue: self 
]

{ #category : #accessing }
ASN1ExternalValue >> externalValue [
	^ contents
]

{ #category : #accessing }
ASN1ExternalValue >> oid [
	^ oid
]

{ #category : #accessing }
ASN1ExternalValue >> oid: anObject [
	oid := anObject
]
