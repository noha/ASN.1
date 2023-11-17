Class {
	#name : #ASN1CurrentContext,
	#superclass : #DynamicVariable,
	#classInstVars : [
		'default'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1CurrentContext class >> default [ 
	 ^ default
]

{ #category : #accessing }
ASN1CurrentContext class >> default: anObject [
	default := anObject
]

{ #category : #'as yet unclassified' }
ASN1CurrentContext >> default [
	^ self class default
]
