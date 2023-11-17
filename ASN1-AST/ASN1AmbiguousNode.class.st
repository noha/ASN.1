Class {
	#name : #ASN1AmbiguousNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name',
		'alternatives',
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1AmbiguousNode >> accept: aVisitor [ 
	^ aVisitor visitAmbiguousNode: self
]

{ #category : #adding }
ASN1AmbiguousNode >> addAlternative: anObject [
	self alternatives add: anObject
]

{ #category : #accessing }
ASN1AmbiguousNode >> alternatives [
	^ alternatives ifNil: [
		alternatives := OrderedCollection new ]
]

{ #category : #accessing }
ASN1AmbiguousNode >> alternatives: anObject [
	alternatives := anObject
]

{ #category : #accessing }
ASN1AmbiguousNode >> name [
	^ name
]

{ #category : #accessing }
ASN1AmbiguousNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1AmbiguousNode >> printOn: aStream [
	aStream nextPutAll: 'ambiguous<'.
	self alternatives 
		do: [:alternative| alternative printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $>
]

{ #category : #accessing }
ASN1AmbiguousNode >> type: anObject [
	type := anObject
]
