Class {
	#name : #ASN1DefaultSyntaxClassNode,
	#superclass : #ASN1ScopeNode,
	#instVars : [
		'fields'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1DefaultSyntaxClassNode class >> name: aString fields: aCollection [
	^ self new
		name: aString;
		fields: aCollection 
]

{ #category : #'as yet unclassified' }
ASN1DefaultSyntaxClassNode class >> name: aString fields: aCollection syntax: aSyntaxCollection [
	^ self new
		name: aString;
		fields: aCollection;
		syntax: aSyntaxCollection  
]

{ #category : #visiting }
ASN1DefaultSyntaxClassNode >> accept: aVisitor [ 
	^ aVisitor visitDefaultSyntaxClassNode: self
]

{ #category : #binding }
ASN1DefaultSyntaxClassNode >> bindingOf: aString [
	self flag: #incomplete.
	^ self fields 
		detect: [:each| each name label = aString ]
		ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
ASN1DefaultSyntaxClassNode >> createInstance: aNode [
	^ aNode
]

{ #category : #accessing }
ASN1DefaultSyntaxClassNode >> fieldAt: aString [
	^ (fields detect: [:each|
		each name label = aString ]) type
]

{ #category : #accessing }
ASN1DefaultSyntaxClassNode >> fields [
	^ fields
]

{ #category : #accessing }
ASN1DefaultSyntaxClassNode >> fields: anObject [
	fields := anObject
]

{ #category : #'as yet unclassified' }
ASN1DefaultSyntaxClassNode >> instantiateFieldAt: aString value: anObject [
	^ (self fieldAt: aString) 
		dereferenced createInstance: anObject
]

{ #category : #testing }
ASN1DefaultSyntaxClassNode >> matchesTypeOf: anObject [ 
	anObject type ifNil: [ Error signal: 'cannot  find type for ', anObject printString ].
	^ anObject type class = self class.

]

{ #category : #printing }
ASN1DefaultSyntaxClassNode >> printOn: aStream [
	aStream
		nextPutAll: self class name
]

{ #category : #accessing }
ASN1DefaultSyntaxClassNode >> typeOf: aString [
	| binding |
	binding := (self bindingOf: aString).
	binding type ifNil: [ 
		binding type: ASN1OpenTypeNode new ].
	^ binding type
]
