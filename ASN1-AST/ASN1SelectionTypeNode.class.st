Class {
	#name : #ASN1SelectionTypeNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'name',
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1SelectionTypeNode >> accept: aVisitor [ 
	^ aVisitor visitSelectionTypeNode: self
]

{ #category : #accessing }
ASN1SelectionTypeNode >> name [
	^ name
]

{ #category : #accessing }
ASN1SelectionTypeNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1SelectionTypeNode >> type [
	^ type
]

{ #category : #accessing }
ASN1SelectionTypeNode >> type: anObject [
	type := anObject
]
