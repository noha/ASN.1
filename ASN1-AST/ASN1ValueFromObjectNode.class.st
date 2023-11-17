Class {
	#name : #ASN1ValueFromObjectNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'object',
		'fields'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ValueFromObjectNode >> accept: aVisitor [
	aVisitor visitValueFromObjectNode: self 
]

{ #category : #accessing }
ASN1ValueFromObjectNode >> fields [
	^ fields
]

{ #category : #accessing }
ASN1ValueFromObjectNode >> fields: anObject [
	fields := anObject
]

{ #category : #accessing }
ASN1ValueFromObjectNode >> object [
	^ object
]

{ #category : #accessing }
ASN1ValueFromObjectNode >> object: anObject [
	object := anObject
]
