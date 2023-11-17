Class {
	#name : #ASN1AssignmentNode,
	#superclass : #ASN1ScopeNode,
	#instVars : [
		'left',
		'right'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1AssignmentNode >> accept: aVisitor [ 
	^ aVisitor visitAssignmentNode: self
]

{ #category : #binding }
ASN1AssignmentNode >> bindingOf: aString [
	right parameters ifNil: [ ^ nil ].
	^ (right parameters anySatisfy: [:each| each contains: aString ])
		ifTrue: [ true ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
ASN1AssignmentNode >> left [
	^ left
]

{ #category : #accessing }
ASN1AssignmentNode >> left: anObject [
	left := anObject
]

{ #category : #printing }
ASN1AssignmentNode >> printOn: aStream [
	aStream 
		nextPutAll: 'assignment ';
		nextPut: Character cr;
		nextPut: Character tab;
		nextPutAll: 'left: ';
		nextPutAll: self left printString.
	aStream
		nextPut: Character cr;
		nextPut: Character tab;
		nextPutAll: 'right: ';
		nextPutAll: self right printString;
		nextPut: Character cr
]

{ #category : #accessing }
ASN1AssignmentNode >> right [
	^ right
]

{ #category : #accessing }
ASN1AssignmentNode >> right: anObject [
	right := anObject
]
