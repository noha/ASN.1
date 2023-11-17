Class {
	#name : #ASN1Scope,
	#superclass : #Object,
	#instVars : [
		'parent',
		'scopeObject'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #binding }
ASN1Scope >> bindingOf: aString [
	^ scopeObject bindingOf: aString
]

{ #category : #resolving }
ASN1Scope >> lookup: aString [
	^ self 
		lookup: aString 
		ifAbsent: [ Error signal: 'couldn''t find declaration of ', aString printString ]
]

{ #category : #resolving }
ASN1Scope >> lookup: aString ifAbsent: aBlock [
	^ (self bindingOf: aString) ifNil: [ 
		parent ifNil: [ aBlock value ].
		parent lookup: aString ifAbsent: aBlock ]
]

{ #category : #resolving }
ASN1Scope >> moduleDefinition [
	^ (scopeObject class = ASN1ModuleDefinitionNode ) 
		ifTrue: [ scopeObject ]
		ifFalse: [ parent moduleDefinition ]
]

{ #category : #accessing }
ASN1Scope >> parent [
	^ parent
]

{ #category : #accessing }
ASN1Scope >> scopeObject [
	^ scopeObject
]

{ #category : #accessing }
ASN1Scope >> scopeObject: anObject [
	scopeObject := anObject
]

{ #category : #accessing }
ASN1Scope >> setParent: aScope [
	parent := aScope
]
