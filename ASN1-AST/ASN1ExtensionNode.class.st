Class {
	#name : #ASN1ExtensionNode,
	#superclass : #ASN1ASTNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ExtensionNode >> accept: aVisitor [ 	
	^ aVisitor visitExtensionNode: self 
]

{ #category : #converting }
ASN1ExtensionNode >> asUnion [
	^ ASN1UnionNode new 
		elements: (Array with: self )
]

{ #category : #printing }
ASN1ExtensionNode >> printOn: aStream [
	aStream nextPutAll: 'EXTENSION'
]

{ #category : #accessing }
ASN1ExtensionNode >> type: anObject [
	
]
