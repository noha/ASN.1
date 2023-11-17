Class {
	#name : #ASN1AdaptiveTypeExternal,
	#superclass : #ASN1AdaptiveTypeValue,
	#instVars : [
		'oid',
		'value',
		'encoded'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> at: aKey [
	^ value at: aKey
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> decoded: anObject [ 
	value := anObject
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveTypeExternal >> doesNotUnderstand: aMessage [
	^ aMessage sendTo: value
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> encoded [
	^ encoded
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> encoded: anObject [
	encoded := anObject
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveTypeExternal >> externalValue [
	^ value
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> oid [
	^ oid
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> oid: anObject [
	oid := anObject
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> value [
	^ value
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> value: anObject [
	value := anObject
]

{ #category : #accessing }
ASN1AdaptiveTypeExternal >> valueClass [
	^ nil
]
