Class {
	#name : #ASN1SetType,
	#superclass : #ASN1ConstructedType,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1SetType >> accept: aVisitor [ 
	aVisitor visitSet: self
]

{ #category : #accessing }
ASN1SetType >> elements [
	^ elements
]

{ #category : #accessing }
ASN1SetType >> elements: anElementsSpec [ 	
	elements := anElementsSpec 
]

{ #category : #finding }
ASN1SetType >> findElement: aBlock [
	^ elements findElement: aBlock
]

{ #category : #testing }
ASN1SetType >> includes: aType [
	^ elements notNil and: [ elements includes: aType ]
]
