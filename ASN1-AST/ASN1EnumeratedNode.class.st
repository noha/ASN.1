Class {
	#name : 'ASN1EnumeratedNode',
	#superclass : 'ASN1CollectionNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'visiting' }
ASN1EnumeratedNode >> accept: aVisitor [ 
	^ aVisitor visitEnumeratedNode: self
]

{ #category : 'as yet unclassified' }
ASN1EnumeratedNode >> bindingOf: aString [
	^ self elements 
		detect: [ :each | each name = aString ]
		ifNone: [  nil ]
]
