Class {
	#name : #ASN1ModifierDefaultValueNode,
	#superclass : #ASN1ModifierNode,
	#instVars : [
		'value',
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ModifierDefaultValueNode >> accept: aVisitor [ 
	^ aVisitor visitModifierDefaultValueNode: self
]

{ #category : #'as yet unclassified' }
ASN1ModifierDefaultValueNode >> isDefaultValue [ 
	^ true
]

{ #category : #printing }
ASN1ModifierDefaultValueNode >> printOn: aStream [
	aStream 
		nextPutAll: 'default value=';
		nextPutAll: value asString
]

{ #category : #accessing }
ASN1ModifierDefaultValueNode >> type [
	^ type
]

{ #category : #accessing }
ASN1ModifierDefaultValueNode >> type: anObject [
	value type: anObject
]

{ #category : #accessing }
ASN1ModifierDefaultValueNode >> value [
	^ value
]

{ #category : #accessing }
ASN1ModifierDefaultValueNode >> value: anObject [
	value := anObject
]
