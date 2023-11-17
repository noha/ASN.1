Class {
	#name : #ASN1ComponentsOfNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ComponentsOfNode >> accept: aVisitor [ 
	^ aVisitor visitComponentsOfNode: self
]

{ #category : #printing }
ASN1ComponentsOfNode >> printOn: aStream [
	aStream 
		nextPutAll: 'components of ';
		nextPutAll: type printString
]

{ #category : #accessing }
ASN1ComponentsOfNode >> type [
	^ type
]

{ #category : #accessing }
ASN1ComponentsOfNode >> type: anObject [
	type := anObject
]
