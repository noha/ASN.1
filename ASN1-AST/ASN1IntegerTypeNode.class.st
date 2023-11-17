Class {
	#name : #ASN1IntegerTypeNode,
	#superclass : #ASN1PrimitiveTypeNode,
	#instVars : [
		'namedNumbers'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1IntegerTypeNode >> accept: aVisitor [ 
	^ aVisitor visitIntegerNode: self
]

{ #category : #accessing }
ASN1IntegerTypeNode >> addNamedNumber: aNamedNumber [
	self namedNumbers add: aNamedNumber
]

{ #category : #resolving }
ASN1IntegerTypeNode >> bindingOf: aString [
	^ namedNumbers ifNotNil: [ 
		 namedNumbers
			detect: [ :each | each name = aString ]
			ifNone: [ nil ] ]
]

{ #category : #'as yet unclassified' }
ASN1IntegerTypeNode >> createInstance: aNode [
	^ (aNode class = ASN1IntegerValueNode )
		ifTrue: [ aNode ]
		ifFalse: [ ASN1IntegerValueNode new value: aNode ]

]

{ #category : #'initialize-release' }
ASN1IntegerTypeNode >> initialize [ 
	super initialize.
	name := 'INTEGER'
]

{ #category : #accessing }
ASN1IntegerTypeNode >> namedNumbers [
	^ namedNumbers ifNil: [
		namedNumbers := OrderedCollection new ]
]

{ #category : #accessing }
ASN1IntegerTypeNode >> namedNumbers: anObject [
	namedNumbers := anObject
]
