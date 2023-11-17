Class {
	#name : #ASN1TaggedTypeNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'tag',
		'type',
		'tagEnvironment'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1TaggedTypeNode >> accept: aVisitor [ 
	^ aVisitor visitTaggedTypeNode: self
]

{ #category : #accessing }
ASN1TaggedTypeNode >> basicType [
	^ self type basicType
]

{ #category : #'as yet unclassified' }
ASN1TaggedTypeNode >> bindingOf: aString [
	^ type bindingOf: aString
]

{ #category : #testing }
ASN1TaggedTypeNode >> matchesTypeOf: aTypeNodeClass [ 
	^ type matchesTypeOf: aTypeNodeClass 
]

{ #category : #printing }
ASN1TaggedTypeNode >> printOn: aStream [
	aStream 
		nextPutAll: type printString.
	aStream
		nextPutAll: 'TAG-';
		nextPutAll: self tag printString

]

{ #category : #accessing }
ASN1TaggedTypeNode >> tag [
	^ self propertyAt: #tag
]

{ #category : #accessing }
ASN1TaggedTypeNode >> tag: anObject [
	self propertyAt: #tag put: anObject
]

{ #category : #accessing }
ASN1TaggedTypeNode >> tagEnvironment [
	^ tagEnvironment
]

{ #category : #accessing }
ASN1TaggedTypeNode >> tagEnvironment: aTagEnvironment [
	tagEnvironment := aTagEnvironment
]

{ #category : #accessing }
ASN1TaggedTypeNode >> type [
	^ type
]

{ #category : #accessing }
ASN1TaggedTypeNode >> type: anObject [
	type := anObject
]
