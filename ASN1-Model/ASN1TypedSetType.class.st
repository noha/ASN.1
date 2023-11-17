Class {
	#name : #ASN1TypedSetType,
	#superclass : #ASN1TypedCollectionType,
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1TypedSetType class >> universalType [
	^ 'SET'
]

{ #category : #visiting }
ASN1TypedSetType >> accept: aVisitor [ 
	^ aVisitor visitTypedSet: self 
]
