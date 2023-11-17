Class {
	#name : #ASN1ElementComplement,
	#superclass : #ASN1ElementSet,
	#instVars : [
		'included',
		'excluded'
	],
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ElementComplement >> accept: anASN1ModelBuilderVisitor [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
ASN1ElementComplement >> excluded [
	^ excluded
]

{ #category : #accessing }
ASN1ElementComplement >> excluded: anObject [
	excluded := anObject
]

{ #category : #finding }
ASN1ElementComplement >> findElement: aBlock [
	^ included findElement: aBlock
]

{ #category : #accessing }
ASN1ElementComplement >> included [
	^ included
]

{ #category : #accessing }
ASN1ElementComplement >> included: anObject [
	included := anObject
]

{ #category : #testing }
ASN1ElementComplement >> includes: aType [ 
	^ (included includes: aType) 
		and: [ excluded isNil or: [ (excluded includes: aType) not ]  ] 
]
