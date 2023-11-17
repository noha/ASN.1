Class {
	#name : #ASN1Configuration,
	#superclass : #Object,
	#instVars : [
		'failOnReservedWords'
	],
	#classInstVars : [
		'default'
	],
	#category : 'ASN1-Syntax'
}

{ #category : #accessing }
ASN1Configuration class >> default [
	^ default ifNil: [
		default := self new ]
]

{ #category : #accessing }
ASN1Configuration >> failOnReservedWords [
	^ failOnReservedWords
]

{ #category : #accessing }
ASN1Configuration >> failOnReservedWords: anObject [
	failOnReservedWords := anObject
]

{ #category : #'initialize-release' }
ASN1Configuration >> initialize [
	super initialize.
	failOnReservedWords := true.
]
