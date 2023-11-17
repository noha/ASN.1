Class {
	#name : #ASN1ChoiceValue,
	#superclass : #ASN1ValueObject,
	#instVars : [
		'value'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ChoiceValue >> accept: aVisitor [ 
	^ aVisitor visitChoiceValue: self
]

{ #category : #accessing }
ASN1ChoiceValue >> value [
	^ value 
]

{ #category : #accessing }
ASN1ChoiceValue >> value: anObject [
	value := anObject
]
