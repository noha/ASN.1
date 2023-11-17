Class {
	#name : #ASN1TestModel,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : 'ASN1-Tests-Model'
}

{ #category : #'as yet unclassified' }
ASN1TestModel class >> build [
	^ self build: self libraryNames
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> build: aCollection [
	| asn1 |
	asn1 := ASN1 new.
	aCollection do: [ :each| asn1 addLibrary: each new ].
	^ asn1 model
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> instance [
	^ instance ifNil: [ 
		instance := self build ]
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> instance: anObject [
	instance := anObject
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> readFromFileNamed: aString [
	^ FLMaterializer materializeFromFileNamed: aString
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> reset [
	instance := nil
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> resetAll [
	self allSubclasses do: #reset
]

{ #category : #'as yet unclassified' }
ASN1TestModel class >> storeInFileNamed: aString [
	FLSerializer serialize: self build toFileNamed: aString
]
