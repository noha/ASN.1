Class {
	#name : #ASN1AdaptiveTypeCollection,
	#superclass : #ASN1AdaptiveTypeValue,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1AdaptiveTypeCollection >> add: anObject [
	elements add: anObject. 
]

{ #category : #'as yet unclassified' }
ASN1AdaptiveTypeCollection >> addAll: aCollection [
	elements addAll: aCollection. 
]

{ #category : #accessing }
ASN1AdaptiveTypeCollection >> addUsing: aBlock [
	"create a new object of the nested type and hand it over
	to the given block for initialization. Add the return value in
	the internal collection."
	| newValue |
	newValue := type basicType type newValue.
	aBlock value: newValue.
	^ self add: newValue
]

{ #category : #finding }
ASN1AdaptiveTypeCollection >> basicFind: aKey [
	^ self find: aKey in: elements
]

{ #category : #iterating }
ASN1AdaptiveTypeCollection >> collect: aBlock [
	^ elements collect: aBlock
]

{ #category : #accessing }
ASN1AdaptiveTypeCollection >> elements [
	^ elements
]

{ #category : #accessing }
ASN1AdaptiveTypeCollection >> first [
	^ elements first
]

{ #category : #initialization }
ASN1AdaptiveTypeCollection >> initialize [
	super initialize.
	elements := OrderedCollection new
]

{ #category : #initialize }
ASN1AdaptiveTypeCollection >> initializeFrom: anObject [ 
	
]

{ #category : #testing }
ASN1AdaptiveTypeCollection >> isEmpty [
	^ elements isEmpty
]

{ #category : #testing }
ASN1AdaptiveTypeCollection >> isEmptyOrNil [
	^ elements isEmptyOrNil 
]

{ #category : #accessing }
ASN1AdaptiveTypeCollection >> size [
	^ elements size
]

{ #category : #accessing }
ASN1AdaptiveTypeCollection >> value: aCollection [
	elements := aCollection asOrderedCollection
]
