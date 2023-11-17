Class {
	#name : #ASN1ChoiceValueNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'choice',
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ChoiceValueNode >> accept: aVisitor [ 
	^ aVisitor visitChoiceValueNode: self
]

{ #category : #accessing }
ASN1ChoiceValueNode >> choice [
	^ choice
]

{ #category : #accessing }
ASN1ChoiceValueNode >> choice: anObject [
	choice := anObject
]

{ #category : #accessing }
ASN1ChoiceValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1ChoiceValueNode >> value: anObject [
	value := anObject
]
