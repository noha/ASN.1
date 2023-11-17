Class {
	#name : #ASN1EncodedError,
	#superclass : #ASN1StreamValue,
	#category : 'ASN1-Codec'
}

{ #category : #testing }
ASN1EncodedError >> hasError [
	^ true
]

{ #category : #testing }
ASN1EncodedError >> isError [
	^ true
]
