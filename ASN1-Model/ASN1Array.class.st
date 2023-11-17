Class {
	#name : #ASN1Array,
	#superclass : #ASN1Composite,
	#instVars : [
		'collection'
	],
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1Array class >> new [
	^ super new
]

{ #category : #'as yet unclassified' }
ASN1Array >> add: anObject [
	^ collection add: anObject
]

{ #category : #'as yet unclassified' }
ASN1Array >> addAll: aCollection [
	aCollection do: [:each|
		self add: each ]
]

{ #category : #converting }
ASN1Array >> asOrderedCollection [
	^ collection asOrderedCollection
]

{ #category : #'as yet unclassified' }
ASN1Array >> basicFind: aKey [
	^ self find: aKey in: collection
]

{ #category : #'as yet unclassified' }
ASN1Array >> collect: aBlock [
	^ collection collect: aBlock
]

{ #category : #'as yet unclassified' }
ASN1Array >> detect: aBlock [
	^ collection detect: aBlock
]

{ #category : #'as yet unclassified' }
ASN1Array >> do: aBlock [
	collection do: aBlock
]

{ #category : #'as yet unclassified' }
ASN1Array >> elements [
	^ collection
]

{ #category : #'as yet unclassified' }
ASN1Array >> first [
	^ collection first
]

{ #category : #'as yet unclassified' }
ASN1Array >> initialize [ 
	super initialize.
	collection := OrderedCollection new
]

{ #category : #'as yet unclassified' }
ASN1Array >> jsonWriteOn: aStream [
	collection jsonWriteOn: aStream
]

{ #category : #'as yet unclassified' }
ASN1Array >> keysAndValuesDo: aBlock [
	collection do: [:each|
		aBlock value: each key value: each value ]
]

{ #category : #'as yet unclassified' }
ASN1Array >> printOn: aStream [
	aStream nextPutAll: 'ASN1Array ['.
	collection do: [:each|
		each printOn: aStream.
		aStream nextPut: Character cr ].
	aStream nextPutAll: ' ]'
]

{ #category : #'as yet unclassified' }
ASN1Array >> second [
	^ collection second
]

{ #category : #'as yet unclassified' }
ASN1Array >> size [
	^ collection size 
]
