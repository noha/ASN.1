Class {
	#name : #ASN1Constraint,
	#superclass : #ASN1BasicObject,
	#instVars : [
		'constraint',
		'exception'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1Constraint >> constraint [
	^ constraint
]

{ #category : #accessing }
ASN1Constraint >> constraint: anObject [
	constraint := anObject
]

{ #category : #accessing }
ASN1Constraint >> exception [
	^ exception
]

{ #category : #accessing }
ASN1Constraint >> exception: anObject [
	exception := anObject
]

{ #category : #testing }
ASN1Constraint >> includes: anObject [
	^ (constraint includes: anObject) and: [ 
		exception notNil and: [ (exception includes: anObject) not ] ]
]
