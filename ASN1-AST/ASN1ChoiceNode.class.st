Class {
	#name : #ASN1ChoiceNode,
	#superclass : #ASN1CollectionNode,
	#instVars : [
		'rest'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ChoiceNode >> accept: aVisitor [ 
	^ aVisitor visitChoiceNode: self
]

{ #category : #'as yet unclassified' }
ASN1ChoiceNode >> createInstance: aNode [
	| type |
	type := (self elementAt: aNode choice) type.
	^ type createInstance: aNode value
]

{ #category : #'as yet unclassified' }
ASN1ChoiceNode >> elementAt: aString [
	^ elements 
		detect: [:each| each name = aString ]
		ifNone: [ nil ]
]

{ #category : #printing }
ASN1ChoiceNode >> printOn: aStream [
	aStream nextPutAll: 'CHOICE{'.
	super printOn: aStream.
	aStream nextPut: $}
]

{ #category : #accessing }
ASN1ChoiceNode >> rest [
	^ rest
]

{ #category : #accessing }
ASN1ChoiceNode >> rest: anObject [
	rest := anObject
]
