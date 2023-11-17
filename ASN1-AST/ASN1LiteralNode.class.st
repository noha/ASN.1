Class {
	#name : #ASN1LiteralNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'string'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1LiteralNode >> = aLiteral [
	(self class = aLiteral class) ifFalse: [ ^ false ].
	^ string = aLiteral string
]

{ #category : #'as yet unclassified' }
ASN1LiteralNode >> accept: aVisitor [
	aVisitor visitLiteralNode: self
]

{ #category : #'as yet unclassified' }
ASN1LiteralNode >> hash [
	^ string hash
]

{ #category : #testing }
ASN1LiteralNode >> isLiteralNode [
	^ true
]

{ #category : #parsing }
ASN1LiteralNode >> parse: aStream into: aDictionary [
	| streamToken |
	streamToken := aStream next.
	(streamToken = self) ifFalse: [
		aStream position: aStream position - 1.
		^ ASN1ParseError signal: 'literals do not match' ]
]

{ #category : #'as yet unclassified' }
ASN1LiteralNode >> printOn: aStream [
	aStream 
		nextPut: $#;
		nextPutAll: string
]

{ #category : #accessing }
ASN1LiteralNode >> string [
	^ string
]

{ #category : #accessing }
ASN1LiteralNode >> string: anObject [
	string := anObject
]
