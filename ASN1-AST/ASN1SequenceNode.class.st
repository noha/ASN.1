Class {
	#name : #ASN1SequenceNode,
	#superclass : #ASN1CollectionNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1SequenceNode >> accept: aVisitor [ 
	^ aVisitor visitSequenceNode: self
]

{ #category : #'as yet unclassified' }
ASN1SequenceNode >> bindingOf: aString [ 
	elements do: [  :each |
		(each bindingOf: aString) ifNotNil: [ :val |
			^ val ]].
	^ nil
]

{ #category : #printing }
ASN1SequenceNode >> printOn: aStream [
	aStream nextPutAll: 'SEQUENCE{'.
	super printOn: aStream.
	aStream nextPut: $}
]
