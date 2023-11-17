Class {
	#name : #ASN1BasicObject,
	#superclass : #Object,
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1BasicObject class >> asn1InstanceFactory [
	^ self 
]

{ #category : #testing }
ASN1BasicObject class >> isAsn1ModelClass [
	^ false
]

{ #category : #finding }
ASN1BasicObject >> findElement: aBlock [ 
	^ (aBlock value: self) 
		ifTrue: [  self  ]
		ifFalse: [  nil  ]
]

{ #category : #testing }
ASN1BasicObject >> includes: anObject [
	^ self == anObject
]

{ #category : #'*asn1-model' }
ASN1BasicObject >> isAsn1 [
	^ true
]

{ #category : #'*asn1-model' }
ASN1BasicObject >> isAsn1Object [
	^ false
]

{ #category : #testing }
ASN1BasicObject >> isExtension [
	^ false
]

{ #category : #printing }
ASN1BasicObject >> printOn: aStream [
	aStream nextPutAll: self class name
]
