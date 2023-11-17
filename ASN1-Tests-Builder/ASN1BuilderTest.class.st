Class {
	#name : #ASN1BuilderTest,
	#superclass : #ASN1ExampleGrammarTest,
	#category : 'ASN1-Tests-Builder'
}

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testChoiceWithImplicitContextTags [ 
	| model |
	model := self modelBindingValue:  'ChoiceWithImplicitTaggedTypes'.
	self assert: model elements associations first value tag = (ASN1Tag new clazz: nil; number: 0).
	self assert: model elements associations second value tag = (ASN1Tag new clazz: nil; number: 1).
]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testComplexChoice [
	| type |
	type := self modelBindingValue: 'ComplexChoice'.
	self assert: type elements size = 4.
	self assert: type elements associations first value type elements size = 2.

]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testConstructedComplexChoice [
	| sequence basicService |
	sequence := (self modelBindingValue: 'SequenceWithConstruction') type.
	basicService := (sequence elementAt: 'basicService') value.
	self assert: basicService type tag = (ASN1Tag new number: 5; yourself).
]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testDefinedObjectFromDefinedSyntax [
	| object |
	object:= self modelBindingValue: 'purgeMS' .
	self assert: object isAsn1Node not.
	self assert: (object attributeAt: 'operationCode') contents = 67

]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testDefinedSyntax [
	| model |
	model := self modelBindingValue:  'objectFromDefinedSyntax'.
	
]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testQueryOidBindingName [
	| name |
	name := self model bindingNameOfOid: '0.4.0.0.1.1.1.1'.
	self assert: name = 'map-DialogueAS'
]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testRelativeOidResolving [
	| type |
	type := self modelBindingValue:  'map-DialogueAS'.
	self assert: type contents = '0.4.0.0.1.1.1.1'
]

{ #category : #'as yet unclassified' }
ASN1BuilderTest >> testResource [
	self assert: self resource model class = ASN1CachedModelRoot 
]
