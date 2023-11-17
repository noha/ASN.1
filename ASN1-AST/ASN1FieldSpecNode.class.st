Class {
	#name : #ASN1FieldSpecNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name',
		'type'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1FieldSpecNode >> accept: aVisitor [ 
	^ aVisitor visitFieldSpecNode: self
]

{ #category : #accessing }
ASN1FieldSpecNode >> name [
	^ name
]

{ #category : #accessing }
ASN1FieldSpecNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1FieldSpecNode >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $:;
		nextPutAll: self name printString 
]

{ #category : #accessing }
ASN1FieldSpecNode >> type [
	^ type
]

{ #category : #accessing }
ASN1FieldSpecNode >> type: anObject [
	self flag: #needsCheck.
	type := (anObject isNil)
		ifTrue: [ ASN1OpenTypeNode new ]
		ifFalse: [ anObject ]
]
