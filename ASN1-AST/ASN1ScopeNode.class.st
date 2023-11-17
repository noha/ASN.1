Class {
	#name : #ASN1ScopeNode,
	#superclass : #ASN1ASTNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #binding }
ASN1ScopeNode >> bindingOf: aString [
	self subclassResponsibility 
]
