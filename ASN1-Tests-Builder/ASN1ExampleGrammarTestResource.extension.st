Extension { #name : #ASN1ExampleGrammarTestResource }

{ #category : #'*ASN1-Tests-Builder' }
ASN1ExampleGrammarTestResource >> model [
	^ model ifNil: [
		model := self ast buildModel: ASN1CachedModelRoot ]
]

{ #category : #'*ASN1-Tests-Builder' }
ASN1ExampleGrammarTestResource >> modelBindingValue: aString [
	^ (self model bindingNamed: aString) value
]
