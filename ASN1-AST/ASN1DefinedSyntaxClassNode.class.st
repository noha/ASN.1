Class {
	#name : #ASN1DefinedSyntaxClassNode,
	#superclass : #ASN1DefaultSyntaxClassNode,
	#instVars : [
		'syntax'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1DefinedSyntaxClassNode >> accept: aVisitor [ 
	^ aVisitor visitDefinedSyntaxClassNode: self
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxClassNode >> assignDefaultTypes [
	"default values should have type information. It is safe to set it to the fields type if
	not already set otherwise"
	self fields do: [ :field |
		field hasDefaultValue ifTrue: [ 
			field defaultValue type ifNil: [
				field defaultValue type: field type ] ] ]
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxClassNode >> matchesSyntax: aCollection [
	[ self parseSyntax: aCollection ]
		on: Error
		do: [:err|  ^ false].
	^ true
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxClassNode >> parseSyntax: aSyntax [
	| dict |
	dict := Dictionary new.
	syntax parse: aSyntax readStream into: dict.
	self assignDefaultTypes.
	self validateFields: dict.
	^ dict
]

{ #category : #accessing }
ASN1DefinedSyntaxClassNode >> syntax [
	^ syntax
]

{ #category : #accessing }
ASN1DefinedSyntaxClassNode >> syntax: anObject [
	syntax := anObject
]

{ #category : #'as yet unclassified' }
ASN1DefinedSyntaxClassNode >> validateFields: aDictionary [
	self fields do: [:field| | value |
		aDictionary at: field name label ifAbsent: [.
			(field isOptional or: [ field hasDefaultValue ]) ifFalse: [ 
				Error signal: 'missing field ', field name printString  ].
			(field type notNil and: [ field hasDefaultValue ]) ifTrue: [
				(field type validate: field defaultValue) ifFalse: [
					Error signal: 'field default value type does not conform to field type'] ]]]
]
