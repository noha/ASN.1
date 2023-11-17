Class {
	#name : #ASN1IntegerValueNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1IntegerValueNode >> accept: aVisitor [ 
	^ aVisitor visitIntegerValueNode: self 
]

{ #category : #accessing }
ASN1IntegerValueNode >> defaultTypeClass [
	^ ASN1IntegerTypeNode 
]

{ #category : #printing }
ASN1IntegerValueNode >> printOn: aStream [
	aStream
		nextPutAll: 'integer '.
	value printOn: aStream
]

{ #category : #accessing }
ASN1IntegerValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1IntegerValueNode >> value: anObject [
	value := anObject
]
