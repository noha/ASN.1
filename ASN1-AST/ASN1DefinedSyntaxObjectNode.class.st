Class {
	#name : #ASN1DefinedSyntaxObjectNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'syntax'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1DefinedSyntaxObjectNode >> accept: aVisitor [ 
	^ aVisitor visitDefinedSyntaxObjectNode: self
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxObjectNode >> basicTypeLabel [
	^ #object
]

{ #category : #accessing }
ASN1DefinedSyntaxObjectNode >> fieldNamed: aString [
	^ (self type definition bindingOf: aString) definition
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxObjectNode >> isValid [
	^ self type definition matchesSyntax: syntax
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxObjectNode >> parseSyntax [
	^ self  type definition parseSyntax: syntax
]

{ #category : #printing }
ASN1DefinedSyntaxObjectNode >> printOn: aStream [
	aStream 
		nextPutAll: 'object from defined syntax [ ';
		nextPutAll: syntax printString;
		nextPutAll: ' ]'
]

{ #category : #accessing }
ASN1DefinedSyntaxObjectNode >> syntax [
	^ syntax
]

{ #category : #accessing }
ASN1DefinedSyntaxObjectNode >> syntax: anObject [
	syntax := anObject
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxObjectNode >> type [
	^ self propertyAt: #type
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxObjectNode >> type: anObject [
	self propertyAt: #type put: anObject
]
