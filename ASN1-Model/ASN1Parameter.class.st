Class {
	#name : #ASN1Parameter,
	#superclass : #ASN1BasicObject,
	#instVars : [
		'name',
		'type'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1Parameter >> name [
	^ name
]

{ #category : #accessing }
ASN1Parameter >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1Parameter >> type [
	^ type
]

{ #category : #accessing }
ASN1Parameter >> type: anObject [
	type := anObject
]
