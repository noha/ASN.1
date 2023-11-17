Class {
	#name : #ASN1TypedSequenceType,
	#superclass : #ASN1TypedCollectionType,
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1TypedSequenceType class >> universalType [
	^ 'SEQUENCE'
]

{ #category : #visiting }
ASN1TypedSequenceType >> accept: aVisitor [ 
	^ aVisitor visitTypedSequence: self
]

{ #category : #'as yet unclassified' }
ASN1TypedSequenceType >> tag [
	^ self universalTag
]

{ #category : #validating }
ASN1TypedSequenceType >> validate: aCollection [
	
]
