Class {
	#name : #ASN1NamedNumber,
	#superclass : #ASN1BasicObject,
	#instVars : [
		'name',
		'number'
	],
	#category : 'ASN1-Model'
}

{ #category : #creating }
ASN1NamedNumber class >> name: aString number: aNumber [
	^ self new 
		name: aString;
		number:aNumber
]

{ #category : #visiting }
ASN1NamedNumber >> accept: aVisitor [ 
	^ aVisitor visitNamedNumber: self
]

{ #category : #accessing }
ASN1NamedNumber >> name [
	^ name 
]

{ #category : #accessing }
ASN1NamedNumber >> name: aString [ 
	name := aString
]

{ #category : #accessing }
ASN1NamedNumber >> number [
	^ number
]

{ #category : #accessing }
ASN1NamedNumber >> number: aNumber [
	number := aNumber
]

{ #category : #printing }
ASN1NamedNumber >> printOn: aStream [
	aStream 
		nextPutAll: 'named number: ';
		nextPutAll: name printString;
		nextPut: $(;
		nextPutAll: number printString;
		nextPut: $)
]
