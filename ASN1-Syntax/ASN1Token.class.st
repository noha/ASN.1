Class {
	#name : #ASN1Token,
	#superclass : #PPToken,
	#instVars : [
		'comments'
	],
	#category : 'ASN1-Syntax'
}

{ #category : #accessing }
ASN1Token >> comments [
	^ comments
]

{ #category : #accessing }
ASN1Token >> comments: anArray [
	comments := anArray
]

{ #category : #compatiblity }
ASN1Token >> length [
	^ self size
]
