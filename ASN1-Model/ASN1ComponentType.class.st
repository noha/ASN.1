Class {
	#name : #ASN1ComponentType,
	#superclass : #ASN1TypeObject,
	#instVars : [
		'type',
		'modifier'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ComponentType >> accept: aVisitor [
	^ aVisitor visitComponentType: self  
]

{ #category : #accessing }
ASN1ComponentType >> asn1ValueClass [
	^ type asn1ValueClass
]

{ #category : #accessing }
ASN1ComponentType >> basicType [
	^ type basicType
]

{ #category : #accessing }
ASN1ComponentType >> defaultValue [
	^ modifier value
]

{ #category : #accessing }
ASN1ComponentType >> doesNotUnderstand: aMessage [
	[ ^  aMessage sendTo: type ]
		on: Error 
		do: [:err | ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #testing }
ASN1ComponentType >> hasDefaultValue [
	^ modifier notNil and: [ modifier isDefaultValue  ]
]

{ #category : #testing }
ASN1ComponentType >> includesTag: aTag [
	^ self type includesTag: aTag
]

{ #category : #testing }
ASN1ComponentType >> isOptional [
	^ modifier notNil and: [ modifier isOptional ]
]

{ #category : #testing }
ASN1ComponentType >> matchesValue: aValue [
	^ type matchesValue: aValue
]

{ #category : #accessing }
ASN1ComponentType >> modifier [
	^ modifier
]

{ #category : #accessing }
ASN1ComponentType >> modifier: aModifier [
	modifier := aModifier
]

{ #category : #accessing }
ASN1ComponentType >> newBaseValue: anObject [
	^ type newBaseValue: anObject
]

{ #category : #'instance creation' }
ASN1ComponentType >> newValue [ 
	^ type newValue
]

{ #category : #'instance creation' }
ASN1ComponentType >> newValue: anObject [
	^ type newValue: anObject
]

{ #category : #testing }
ASN1ComponentType >> providesScope [
	^ true
]

{ #category : #accessing }
ASN1ComponentType >> tag [
	^ type tag
]

{ #category : #accessing }
ASN1ComponentType >> type [
	^ type
]

{ #category : #accessing }
ASN1ComponentType >> type: anObject [
	type := anObject
]

{ #category : #validating }
ASN1ComponentType >> validate: anObject [
	type validate: anObject
]
