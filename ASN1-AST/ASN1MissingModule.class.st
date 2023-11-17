Class {
	#name : #ASN1MissingModule,
	#superclass : #Error,
	#instVars : [
		'identifier'
	],
	#category : 'ASN1-AST'
}

{ #category : #accessing }
ASN1MissingModule >> identifier [
	^ identifier
]

{ #category : #accessing }
ASN1MissingModule >> identifier: anIdentifier [
	identifier := anIdentifier 
]

{ #category : #testing }
ASN1MissingModule >> isResumable [ 
	^ true
]
