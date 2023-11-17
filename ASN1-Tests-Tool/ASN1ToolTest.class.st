Class {
	#name : #ASN1ToolTest,
	#superclass : #ASN1ExampleGrammarTest,
	#category : 'ASN1-Tests-Tool'
}

{ #category : #'as yet unclassified' }
ASN1ToolTest >> bindingAt: aString [
	^ (ASN1ExampleGrammarTestResource new model bindingNamed: aString) value.

]

{ #category : #'as yet unclassified' }
ASN1ToolTest >> encodeToByteArray: anObject withBinding: aString tagEnvironment: aTagEnvironment [
	| binding |
	binding := self bindingAt: aString.
	self
		useTagEnvironment: aTagEnvironment
		for: binding 
		during: [
			^ ASN1
				encodeToByteArray: anObject
				usingType: binding ]
]

{ #category : #'as yet unclassified' }
ASN1ToolTest >> readStream: aStream withBinding: aString [ 
	^ self 
		readStream:  aStream 
		withBinding: aString
		tagEnvironment: ASN1ExplicitTags 
]

{ #category : #'as yet unclassified' }
ASN1ToolTest >> readStream: aStream withBinding: aString tagEnvironment: aTagEnvironment [
	| binding |
	binding := self bindingAt: aString.
	self 
		useTagEnvironment: aTagEnvironment  
		for: binding 
		during: [
			^ ASN1
				readFrom:  aStream 
				usingType: binding ]
]

{ #category : #'as yet unclassified' }
ASN1ToolTest >> useTagEnvironment: aTagEnvironment for: aBinding during: aBlock [
	| oldTagEnvironment |
	[
		oldTagEnvironment := aBinding module tagEnvironment.
		aBinding module tagEnvironment: aTagEnvironment .
		aBlock value ]
			ensure: [ aBinding tagEnvironment: oldTagEnvironment ]
]

{ #category : #creating }
ASN1ToolTest >> valueFor: aString [ 
	^ (self bindingAt: aString) newValue
]
