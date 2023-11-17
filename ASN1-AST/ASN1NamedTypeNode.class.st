Class {
	#name : #ASN1NamedTypeNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name',
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1NamedTypeNode >> accept: aVisitor [ 
	^ aVisitor visitNamedTypeNode: self
]

{ #category : #accessing }
ASN1NamedTypeNode >> basicType [
	^ type basicType
]

{ #category : #'as yet unclassified' }
ASN1NamedTypeNode >> bindingOf: aString [
	(name = aString) ifTrue: [ ^ self ].
	^ type bindingOf: aString
]

{ #category : #testing }
ASN1NamedTypeNode >> matchesTypeOf: aTypeNodeClass [ 
	^ type matchesTypeOf: aTypeNodeClass 
]

{ #category : #accessing }
ASN1NamedTypeNode >> name [
	^ name
]

{ #category : #accessing }
ASN1NamedTypeNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1NamedTypeNode >> printOn: aStream [
	aStream 
		nextPutAll: '[named type] ';
		nextPutAll: name printString;
		nextPut: $=;
		nextPutAll: type printString;
		nextPut: $.
]

{ #category : #accessing }
ASN1NamedTypeNode >> type [
	^ type
]

{ #category : #accessing }
ASN1NamedTypeNode >> type: anObject [
	type := anObject
]
