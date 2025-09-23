Class {
	#name : 'ASN1ScopeNode',
	#superclass : 'ASN1ASTNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'binding' }
ASN1ScopeNode >> bindingOf: aString [
	self subclassResponsibility 
]
