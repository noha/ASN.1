Class {
	#name : #ASN1ExampleGrammarTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-AST'
}

{ #category : #accessing }
ASN1ExampleGrammarTest >> ast [
	^ self resource ast
]

{ #category : #accessing }
ASN1ExampleGrammarTest >> astBindingValue: aString [
	^ (self ast bindingNamed: aString) right
]

{ #category : #accessing }
ASN1ExampleGrammarTest >> resource [
	^ ASN1ExampleGrammarTestResource new
]
