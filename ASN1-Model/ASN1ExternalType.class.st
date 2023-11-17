Class {
	#name : #ASN1ExternalType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1ExternalType class >> universalType [
	^ 'EXTERNAL TYPE'
]

{ #category : #visiting }
ASN1ExternalType >> accept: aVisitor [ 
	^ aVisitor visitExternalType: self
]

{ #category : #accessing }
ASN1ExternalType >> asn1ValueClass [
	^ ASN1AdaptiveTypeExternal 
]

{ #category : #testing }
ASN1ExternalType >> isAsn1ExternalType [
	^ true
]

{ #category : #printing }
ASN1ExternalType >> printOn: aStream [
	aStream
		nextPutAll: 'external'
]

{ #category : #validating }
ASN1ExternalType >> validate: anObject [
	super validate: anObject 
	
]
