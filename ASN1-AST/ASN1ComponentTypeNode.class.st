Class {
	#name : #ASN1ComponentTypeNode,
	#superclass : #ASN1NamedTypeNode,
	#instVars : [
		'modifiers'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ComponentTypeNode >> accept: aVisitor [ 
	^ aVisitor visitComponentTypeNode: self
]

{ #category : #'as yet unclassified' }
ASN1ComponentTypeNode >> bindingOf: aString [
	^ type bindingOf: aString
]

{ #category : #accessing }
ASN1ComponentTypeNode >> modifiers [
	^ modifiers
]

{ #category : #accessing }
ASN1ComponentTypeNode >> modifiers: anObject [
	modifiers := anObject
]

{ #category : #printing }
ASN1ComponentTypeNode >> printOn: aStream [
	aStream 
		nextPutAll: '[component type] ';
		nextPutAll: name printString;
		nextPut: $=;
		nextPutAll: type printString;
		nextPut: $. .
	modifiers ifNotNil: [ 
		modifiers printOn: aStream ]

]

{ #category : #testing }
ASN1ComponentTypeNode >> providesScope [ 
	^ true
]
