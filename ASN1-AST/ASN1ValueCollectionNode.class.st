Class {
	#name : #ASN1ValueCollectionNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ValueCollectionNode >> accept: aVisitor [
	aVisitor visitValueCollectionNode: self
]

{ #category : #accessing }
ASN1ValueCollectionNode >> elements [
	^ elements
]

{ #category : #accessing }
ASN1ValueCollectionNode >> elements: anObject [
	elements := anObject
]

{ #category : #parsing }
ASN1ValueCollectionNode >> parse: aStream into: aDictionary [
	| pos |
	elements do: [:each|
		pos := aStream position.
		[ each parse: aStream into: aDictionary ]
			on: ASN1ParseError 
			do: [:err| 
				aStream position: pos.
				each isOptional
					ifFalse: [ err pass ]]]
]

{ #category : #'as yet unclassified' }
ASN1ValueCollectionNode >> size [ 
	^ elements size
]

{ #category : #accessing }
ASN1ValueCollectionNode >> stream [
	^ elements readStream 
]
