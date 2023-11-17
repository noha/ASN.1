Class {
	#name : #ASN1PrimitiveValue,
	#superclass : #ASN1ValueObject,
	#instVars : [
		'contents'
	],
	#category : 'ASN1-Model'
}

{ #category : #'initialize-release' }
ASN1PrimitiveValue class >> contents: aString [
	^ self new
		contents: aString
]

{ #category : #comparing }
ASN1PrimitiveValue >> = anOctetString [
	^ ( type = anOctetString type ) and: [ 
		contents = anOctetString contents ]
]

{ #category : #visiting }
ASN1PrimitiveValue >> accept: aVisitor [ 
	^ aVisitor visitPrimitiveValue: self
]

{ #category : #'as yet unclassified' }
ASN1PrimitiveValue >> baseValue [
	^ self 
]

{ #category : #accessing }
ASN1PrimitiveValue >> contents [
	^ contents
]

{ #category : #accessing }
ASN1PrimitiveValue >> contents: anObject [
	anObject isAsn1 ifTrue: [ Error signal: 'cannot use ASN.1 object as contents' ].
	contents := anObject
]

{ #category : #converting }
ASN1PrimitiveValue >> encodedValue [
	^ type encodedValue: self contents
]

{ #category : #comparing }
ASN1PrimitiveValue >> hasSameValue: aPrimitiveValue [
	^ contents = aPrimitiveValue contents
]

{ #category : #comparing }
ASN1PrimitiveValue >> hash [
	^ type hash bitXor: contents hash
]

{ #category : #testing }
ASN1PrimitiveValue >> isAsn1PrimitiveValue [
	^ true
]

{ #category : #printing }
ASN1PrimitiveValue >> printOn: aStream [
	contents printOn: aStream.
	aStream nextPutAll: ' ['.
	type printOn: aStream.
	aStream nextPutAll: ']'
]
