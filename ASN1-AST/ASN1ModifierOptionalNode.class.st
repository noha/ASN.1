Class {
	#name : 'ASN1ModifierOptionalNode',
	#superclass : 'ASN1ModifierNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'visiting' }
ASN1ModifierOptionalNode >> accept: aVisitor [ 
	^ aVisitor visitModifierOptionalNode: self 
]

{ #category : 'testing' }
ASN1ModifierOptionalNode >> isOptional [
	^ true
]

{ #category : 'as yet unclassified' }
ASN1ModifierOptionalNode >> printOn: aStream [
	aStream nextPutAll: 'optional'
]
