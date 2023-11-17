Class {
	#name : #ASN1NamedValueNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'name',
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1NamedValueNode >> accept: aVisitor [ 
	^ aVisitor visitNamedValueNode: self 
]

{ #category : #accessing }
ASN1NamedValueNode >> name [
	^ name
]

{ #category : #accessing }
ASN1NamedValueNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1NamedValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1NamedValueNode >> value: anObject [
	value := anObject
]
