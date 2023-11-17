Class {
	#name : #ASN1TaggedType,
	#superclass : #ASN1EncodedType,
	#instVars : [
		'type',
		'tag'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1TaggedType >> accept: aVisitor [ 
	^aVisitor visitTaggedType: self 
]

{ #category : #accessing }
ASN1TaggedType >> asn1ValueClass [
	^ ASN1TaggedValue 
]

{ #category : #accessing }
ASN1TaggedType >> basicType [
	^ type basicType
]

{ #category : #accessing }
ASN1TaggedType >> elementAt: aString ifNone: aBlock [
	^ type elementAt: aString ifNone: aBlock
]

{ #category : #'instance creation' }
ASN1TaggedType >> newBaseValue: anObject [
	^ self newValue: anObject
]

{ #category : #'instance creation' }
ASN1TaggedType >> newValue [ 
	^ super newValue
		value: type newValue
]

{ #category : #'instance creation' }
ASN1TaggedType >> newValue: anObject [
	^ super newValue 
		value: anObject
]

{ #category : #accessing }
ASN1TaggedType >> tag [
	^ tag
]

{ #category : #accessing }
ASN1TaggedType >> tag: anObject [
	tag := anObject
]

{ #category : #accessing }
ASN1TaggedType >> type [
	^ type
]

{ #category : #accessing }
ASN1TaggedType >> type: anObject [
	type := anObject
]

{ #category : #validating }
ASN1TaggedType >> validate: anObject [ 
	type validate: anObject
]
