Class {
	#name : #ASN1TypedCollectionType,
	#superclass : #ASN1ConstructedType,
	#instVars : [
		'type'
	],
	#category : 'ASN1-Model'
}

{ #category : #'instance-creation' }
ASN1TypedCollectionType class >> type: aType [
	^ self new
		type: aType
]

{ #category : #accessing }
ASN1TypedCollectionType >> asn1ValueClass [
	^ ASN1AdaptiveTypeCollection 
]

{ #category : #'instance creation' }
ASN1TypedCollectionType >> dispatchInstanceCreationOn: anObjectFactory [ 
	^ type new
]

{ #category : #accessing }
ASN1TypedCollectionType >> type [
	^ type
]

{ #category : #accessing }
ASN1TypedCollectionType >> type: anObject [
	type := anObject
]
