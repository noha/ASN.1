Class {
	#name : #ASN1BooleanValueNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1BooleanValueNode >> accept: aVisitor [ 
	^ aVisitor visitBooleanValueNode: self 
]

{ #category : #accessing }
ASN1BooleanValueNode >> defaultTypeClass [
	^ ASN1BooleanTypeNode 
]

{ #category : #accessing }
ASN1BooleanValueNode >> hasSameType: aType [
	^ self type class = aType class
]

{ #category : #printing }
ASN1BooleanValueNode >> printOn: aStream [
	aStream
		nextPutAll: 'boolean '.
	value printOn: aStream
]

{ #category : #accessing }
ASN1BooleanValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1BooleanValueNode >> value: anObject [
	value := anObject
]
