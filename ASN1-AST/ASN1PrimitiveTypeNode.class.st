Class {
	#name : #ASN1PrimitiveTypeNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'initialize-release' }
ASN1PrimitiveTypeNode class >> name: aString [
	^ self new
		name: aString 
]

{ #category : #visiting }
ASN1PrimitiveTypeNode >> accept: aVisitor [ 
	^ aVisitor visitPrimitiveNode: self
]

{ #category : #testing }
ASN1PrimitiveTypeNode >> isPrimitiveNode [
	^ true
]

{ #category : #testing }
ASN1PrimitiveTypeNode >> isSameType: aType [
	aType isPrimitiveNode ifFalse: [
		^ false ].
	^ name = aType name
]

{ #category : #accessing }
ASN1PrimitiveTypeNode >> name [
	^ name
]

{ #category : #accessing }
ASN1PrimitiveTypeNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1PrimitiveTypeNode >> printOn: aStream [
	aStream 
		nextPutAll: 'primitive [';
		nextPutAll: name printString;
		nextPutAll: '] '.
	super printOn: aStream
]
