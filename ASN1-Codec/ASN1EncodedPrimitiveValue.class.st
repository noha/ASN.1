Class {
	#name : #ASN1EncodedPrimitiveValue,
	#superclass : #ASN1EncodedValue,
	#instVars : [
		'contents'
	],
	#category : 'ASN1-Codec'
}

{ #category : #accessing }
ASN1EncodedPrimitiveValue >> contents [
	^ contents
]

{ #category : #accessing }
ASN1EncodedPrimitiveValue >> contents: anObject [
	contents := anObject
]

{ #category : #'as yet unclassified' }
ASN1EncodedPrimitiveValue >> findValueWithTag: aTag [
	(self tag = aTag) ifTrue: [  ^ self ].
	^ nil
]

{ #category : #testing }
ASN1EncodedPrimitiveValue >> hasContent [
	^ contents notNil 
]

{ #category : #testing }
ASN1EncodedPrimitiveValue >> hasError [
	^ false
]

{ #category : #initialization }
ASN1EncodedPrimitiveValue >> initializeFrom: anObject [
	contents := anObject
]

{ #category : #'as yet unclassified' }
ASN1EncodedPrimitiveValue >> isConstructed [
	^ false
]

{ #category : #accessing }
ASN1EncodedPrimitiveValue >> size [
	^ contents size
]

{ #category : #'as yet unclassified' }
ASN1EncodedPrimitiveValue >> writeOn: aStream [
	aStream nextPutPrimitive: self
]
