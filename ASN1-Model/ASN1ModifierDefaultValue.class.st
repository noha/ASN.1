Class {
	#name : #ASN1ModifierDefaultValue,
	#superclass : #ASN1ModifierOptional,
	#instVars : [
		'value'
	],
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1ModifierDefaultValue >> contains: anObject [
	^ value contains: anObject
]

{ #category : #testing }
ASN1ModifierDefaultValue >> isDefaultValue [
	^ true
]

{ #category : #printing }
ASN1ModifierDefaultValue >> printOn: aStream [
	aStream nextPutAll: 'defaultvalue: '.
	value printOn: aStream
]

{ #category : #accessing }
ASN1ModifierDefaultValue >> value [
	^ value
]

{ #category : #accessing }
ASN1ModifierDefaultValue >> value: anObject [
	value := anObject
]
