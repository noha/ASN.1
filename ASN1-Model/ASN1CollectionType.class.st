Class {
	#name : #ASN1CollectionType,
	#superclass : #ASN1ConstructedType,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1CollectionType >> asn1ValueClass [
	^ ASN1AdaptiveTypeObject 
]

{ #category : #'as yet unclassified' }
ASN1CollectionType >> elementAt: aString [
	^ elements at: aString
]

{ #category : #'as yet unclassified' }
ASN1CollectionType >> elementAt: aString ifNone: aBlock [
	^ elements at: aString ifAbsent: aBlock
]

{ #category : #'as yet unclassified' }
ASN1CollectionType >> elementWithTag: aTag [
	^ self elementWithTag: aTag ifNone: [ NotFound signal ]
]

{ #category : #'as yet unclassified' }
ASN1CollectionType >> elementWithTag: aTag ifNone: aBlock [
	elements associationsDo: [ :each | 
		(each value tag = aTag) ifTrue: [ ^ each ]  ].
	aBlock value
]

{ #category : #accessing }
ASN1CollectionType >> elements [
	^ elements
]

{ #category : #accessing }
ASN1CollectionType >> elements: anObject [
	elements := anObject
]

{ #category : #testing }
ASN1CollectionType >> hasElementWithTag: aTag [
	^ ([ self elementWithTag: aTag ]
		on: NotFound
		do: [ :err| nil  ]) notNil
]

{ #category : #testing }
ASN1CollectionType >> hasElements [
	^ elements notNil and: [ elements notEmpty ]
]

{ #category : #validating }
ASN1CollectionType >> validateType: aType value: aValue [
	(aValue isAsn1Value and: [ aValue type notNil ])
		ifTrue: [  
			(aType acceptsType: aValue type) ifFalse: [ Error signal: 'type mismatch' ].
			aValue validate  ]
		ifFalse: [ 
			aType validate: aValue ] 
]
