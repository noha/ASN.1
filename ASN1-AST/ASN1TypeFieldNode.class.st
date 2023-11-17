Class {
	#name : #ASN1TypeFieldNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'type',
		'fields'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1TypeFieldNode >> accept: aVisitor [ 
	^ aVisitor visitTypeFieldNode: self
]

{ #category : #accessing }
ASN1TypeFieldNode >> fields [
	^ fields
]

{ #category : #accessing }
ASN1TypeFieldNode >> fields: anObject [
	fields := anObject
]

{ #category : #printing }
ASN1TypeFieldNode >> printOn: aStream [
	aStream
		nextPutAll: self type printString.
	fields ifNotNil: [
		aStream nextPut: $..
		fields 
			do: [:each| aStream nextPutAll: each printString ]
			separatedBy: [ aStream nextPut: $. ]]
]

{ #category : #resolving }
ASN1TypeFieldNode >> resolveType [
	| fieldType |
	fieldType := self type.
	self fields do: [:field|
		fieldType := (fieldType definition bindingOf: field label) type ].
	^ fieldType ifNil: [ ASN1OpenTypeNode  new ]

]

{ #category : #accessing }
ASN1TypeFieldNode >> type [
	^ type
]

{ #category : #accessing }
ASN1TypeFieldNode >> type: anObject [
	type := anObject
]
