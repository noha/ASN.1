Class {
	#name : #ASN1DefinitionObject,
	#superclass : #ASN1BasicObject,
	#instVars : [
		'module'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1DefinitionObject >> asn1TypeNamed: aString [
	^ self modelRoot typeNamed: aString
]

{ #category : #accessing }
ASN1DefinitionObject >> modelRoot [
	^ self module modelRoot
]

{ #category : #accessing }
ASN1DefinitionObject >> module [
	^ module
]

{ #category : #accessing }
ASN1DefinitionObject >> module: anObject [
	module := anObject
]

{ #category : #accessing }
ASN1DefinitionObject >> originalBindingName [
	"finds the left value of the assignment in the module where the type has been
	originally defined. Mostly useful for convenience and debugging purposes. 
	If multiple bindings reference the same value only one is returned.  So it is 
	possible that some names are not findable"
	^ self module fields keyAtValue: self 
]
