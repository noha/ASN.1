Class {
	#name : #ASN1ObjectSetNode,
	#superclass : #ASN1ElementSpecNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ObjectSetNode >> accept: aVisitor [ 
	^ aVisitor visitObjectSetNode: self
]

{ #category : #testing }
ASN1ObjectSetNode >> canBeAssignedTo: aTypeNode [ 
	^ aTypeNode matchesTypeOf: self type

]

{ #category : #'as yet unclassified' }
ASN1ObjectSetNode >> defaultTypeClass [
	^ ASN1ObjectSetTypeNode 
]

{ #category : #printing }
ASN1ObjectSetNode >> printOn: aStream [
	aStream nextPutAll: 'OBJECT SET'.
	super printOn: aStream
]

{ #category : #'as yet unclassified' }
ASN1ObjectSetNode >> resolvesIn: aModule [
	| elem |
	elem := aModule resolveName: elementsSpec entity label.
	^ elem basicTypeLabel = #object

]
