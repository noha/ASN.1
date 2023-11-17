Class {
	#name : #ASN1ValueSetNode,
	#superclass : #ASN1ElementSpecNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ValueSetNode >> accept: aVisitor [ 
	^ aVisitor visitValueSetNode: self
]

{ #category : #testing }
ASN1ValueSetNode >> canBeAssignedTo: aTypeNode [ 
	^ aTypeNode matchesTypeOf: self type

]

{ #category : #accessing }
ASN1ValueSetNode >> defaultTypeClass [
	^ ASN1ValueSetTypeNode 
]

{ #category : #printing }
ASN1ValueSetNode >> printOn: aStream [
	aStream nextPutAll: 'VALUESET'.
	super printOn: aStream
]

{ #category : #'as yet unclassified' }
ASN1ValueSetNode >> resolvesIn: aModule [
	| elem |
	elem := aModule resolveName: elementsSpec entity label.
	^ elem basicTypeLabel = #value

]
