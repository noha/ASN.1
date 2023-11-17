Extension { #name : #ASN1ExampleGrammarTest }

{ #category : #'*ASN1-Tests-Builder' }
ASN1ExampleGrammarTest >> model [
	^ self resource model
]

{ #category : #'*ASN1-Tests-Builder' }
ASN1ExampleGrammarTest >> modelBindingValue: aString [
	^ (self model bindingNamed: aString) value
]
