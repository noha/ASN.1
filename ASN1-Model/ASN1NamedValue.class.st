Class {
	#name : #ASN1NamedValue,
	#superclass : #ASN1ValueObject,
	#instVars : [
		'name',
		'value'
	],
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1NamedValue class >> name: aString value: anObject [
	^ self new
		name: aString;
		value: anObject
]

{ #category : #accessing }
ASN1NamedValue >> name [
	^ name
]

{ #category : #accessing }
ASN1NamedValue >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1NamedValue >> printOn: aStream [
	aStream 
		nextPutAll: name asString;
		nextPutAll: ' -> ';
		nextPutAll: value asString
]

{ #category : #accessing }
ASN1NamedValue >> value [
	^ value
]

{ #category : #accessing }
ASN1NamedValue >> value: anObject [
	value := anObject
]
