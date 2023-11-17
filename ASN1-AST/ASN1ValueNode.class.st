Class {
	#name : #ASN1ValueNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ValueNode class >> new [
	(self class = ASN1ValueNode) ifTrue: [
		Error signal: 'abstract'].
	^ super new 
]

{ #category : #accessing }
ASN1ValueNode >> basicTypeLabel [
	^ #value
]

{ #category : #testing }
ASN1ValueNode >> canBeAssignedTo: aType [
	^ aType matchesTypeOf: self

]

{ #category : #accessing }
ASN1ValueNode >> defaultTypeClass [
	self shouldBeImplemented 
]

{ #category : #testing }
ASN1ValueNode >> isValueNode [
	^ true
]

{ #category : #printing }
ASN1ValueNode >> printOn: aStream [
	aStream
		nextPut: $[;
		nextPutAll: self class name printString;
		nextPut: $].
]

{ #category : #accessing }
ASN1ValueNode >> resolvedValue [
	^ self propertyAt: #resolvedValue
]

{ #category : #accessing }
ASN1ValueNode >> resolvedValue: anObject [ 
	self propertyAt: #resolvedValue put: anObject
]

{ #category : #accessing }
ASN1ValueNode >> type [
	^ type ifNil: [ 
		type := self defaultTypeClass new ]
]

{ #category : #accessing }
ASN1ValueNode >> type: aTypeNode [ 
	type := aTypeNode
]
