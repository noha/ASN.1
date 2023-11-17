Class {
	#name : #ASN1TaggedValue,
	#superclass : #ASN1ValueObject,
	#instVars : [
		'value'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1TaggedValue >> at: aKey [
	^ value at: aKey
]

{ #category : #accessing }
ASN1TaggedValue >> at: aKey put: anObject [
	value at: aKey put: anObject
]

{ #category : #accessing }
ASN1TaggedValue >> baseValue [
	^ value baseValue
]

{ #category : #'error handling' }
ASN1TaggedValue >> doesNotUnderstand: aMessage [
	"delegate method calls to value but prevent accidentially unwrapping types. When
	we get back the wrapped type we assume we can return self"
	| returnValue |
	returnValue := aMessage sendTo: value.
	^ (returnValue = value) 
		ifTrue: [ self ]
		ifFalse: [ returnValue ]
]

{ #category : #initializing }
ASN1TaggedValue >> initializeFrom: anObject [
	value initializeFrom: anObject
]

{ #category : #testing }
ASN1TaggedValue >> isAsn1Composite [
	^ value isAsn1Composite 
]

{ #category : #accessing }
ASN1TaggedValue >> size [
	^ value size
]

{ #category : #accessing }
ASN1TaggedValue >> tagByteValue [
	^(Array streamContents: [:str | self tag writeOn:  str constructed: self isConstructed] ) first
]

{ #category : #accessing }
ASN1TaggedValue >> value [
	^ value
]

{ #category : #accessing }
ASN1TaggedValue >> value: anObject [
	anObject ifNil: [ Error signal: 'cannot use nil as value' ].
	value := anObject
]
