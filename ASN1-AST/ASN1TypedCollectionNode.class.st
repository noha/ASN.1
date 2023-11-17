Class {
	#name : #ASN1TypedCollectionNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #accessing }
ASN1TypedCollectionNode >> type [
	^ type
]

{ #category : #accessing }
ASN1TypedCollectionNode >> type: anObject [
	type := anObject
]
