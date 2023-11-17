Class {
	#name : #ASN1PrimitiveValueNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1PrimitiveValueNode >> accept: aVisitor [ 
	^ aVisitor visitPrimitiveValueNode: self
]

{ #category : #testing }
ASN1PrimitiveValueNode >> hasSameType: aTypeNode [ 
	^ type name = aTypeNode name
]

{ #category : #accessing }
ASN1PrimitiveValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1PrimitiveValueNode >> value: anObject [
	value := anObject
]
