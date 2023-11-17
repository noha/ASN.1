Class {
	#name : #ASN1EnumeratedType,
	#superclass : #ASN1PrimitiveType,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1EnumeratedType class >> decode: aCollection [
	^ aCollection first 
]

{ #category : #codec }
ASN1EnumeratedType class >> encode: anInteger [
	^ ASN1IntegerType encode: anInteger
]

{ #category : #'as yet unclassified' }
ASN1EnumeratedType class >> universalType [
	^ 'ENUMERATED'
]

{ #category : #visiting }
ASN1EnumeratedType >> accept: aVisitor [ 
	^ aVisitor visitEnumeratedType: self
]

{ #category : #validating }
ASN1EnumeratedType >> acceptsValue: aString [ 
	^ aString isString
]

{ #category : #accessing }
ASN1EnumeratedType >> asn1ValueClass [
	^ ASN1EnumeratedValue 
]

{ #category : #'as yet unclassified' }
ASN1EnumeratedType >> atName: aString [
	^ elements
		detect: [:each| each name = aString ]
		ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
ASN1EnumeratedType >> atNumber: aNumber [
	^ self namedElements
		detect: [:each| each number = aNumber ]
		ifNone: [ ASN1ElementNotFound signal: 'no entry for number ', aNumber asString, ' found' ]
]

{ #category : #accessing }
ASN1EnumeratedType >> elements [
	^ elements
]

{ #category : #accessing }
ASN1EnumeratedType >> elements: anObject [
	elements := anObject
]

{ #category : #accessing }
ASN1EnumeratedType >> namedElements [
	^ self elements reject: #isExtension
]

{ #category : #'as yet unclassified' }
ASN1EnumeratedType >> printOn: aStream [ 
	aStream nextPutAll: 'ENUMERATED'
]

{ #category : #sanitizing }
ASN1EnumeratedType >> sanitizeValues [
	"enumerated values can be a mix of named numbers and identifiers. In case of identifiers we need
	to automatically assign numbers. We count from zero on upwards. For every number that has not 
	been assigned, yet, we assign the number to the next value without a number"
	| unassigned assignedValues number |
	unassigned := OrderedCollection new.
	assignedValues := OrderedCollection new.
	(elements reject: #isExtension) do: [ :element |
		element number isNil 
			ifTrue: [ unassigned add: element ]
			ifFalse: [ assignedValues add: element number ] ].
	number := 0.
	[ unassigned isEmpty ] whileFalse: [ 
		[  assignedValues includes: number ] whileTrue: [ number := number + 1 ].
		unassigned removeFirst number: number.
		assignedValues add: number ]
	
]
