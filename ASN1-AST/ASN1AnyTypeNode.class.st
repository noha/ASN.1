Class {
	#name : #ASN1AnyTypeNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'id'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1AnyTypeNode >> accept: aVisitor [ 
	^ aVisitor visitAnyTypeNode: self 
]

{ #category : #accessing }
ASN1AnyTypeNode >> id [
	^ id
]

{ #category : #accessing }
ASN1AnyTypeNode >> id: anObject [
	id := anObject
]
