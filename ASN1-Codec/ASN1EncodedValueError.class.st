Class {
	#name : #ASN1EncodedValueError,
	#superclass : #Error,
	#instVars : [
		'content',
		'encodedValue'
	],
	#category : 'ASN1-Codec'
}

{ #category : #'as yet unclassified' }
ASN1EncodedValueError >> content: anObject [
	content := anObject
]

{ #category : #accessing }
ASN1EncodedValueError >> encodedValue [
	^ encodedValue
]

{ #category : #'as yet unclassified' }
ASN1EncodedValueError >> encodedValue: aCollection [
	encodedValue := aCollection
]
