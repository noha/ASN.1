Class {
	#name : #ASN1OpenType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1OpenType class >> universalType [
	^ 'OPEN TYPE'
]

{ #category : #visiting }
ASN1OpenType >> accept: aVisitor [ 
	^ aVisitor visitOpenType: self
]

{ #category : #validating }
ASN1OpenType >> acceptsType: aType [
	^ true
]

{ #category : #accessing }
ASN1OpenType >> asn1ValueClass [
	^ ASN1OpenValue 
]

{ #category : #testing }
ASN1OpenType >> includesTag: aTag [
	^ true
]

{ #category : #testing }
ASN1OpenType >> matchesValue: aValue [
	^ true
]

{ #category : #printing }
ASN1OpenType >> printOn: aStream [
	aStream nextPutAll: 'open type'
]

{ #category : #validating }
ASN1OpenType >> validate: aValue [
	
]
