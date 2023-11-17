Class {
	#name : #ASN1Context,
	#superclass : #Object,
	#instVars : [
		'model',
		'factory'
	],
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1Context >> defaultFactoryClass [
	^ TCAPObjectFactory
]

{ #category : #'as yet unclassified' }
ASN1Context >> do: aBlock [
	^ ASN1CurrentContext 
		value: self
		during: aBlock
]

{ #category : #accessing }
ASN1Context >> factory [
	^ factory ifNil: [ 
		factory := self defaultFactoryClass new
			asn1Model: model ]
]

{ #category : #accessing }
ASN1Context >> factory: anObject [
	factory := anObject.
	model ifNotNil: [ factory asn1Model: model ]
]

{ #category : #accessing }
ASN1Context >> model [
	^ model
]

{ #category : #accessing }
ASN1Context >> model: anObject [
	model := anObject.
	factory ifNotNil: [ factory asn1Model: model ]
]

{ #category : #accessing }
ASN1Context >> moduleDefiningOid: aString [ 
	^ factory moduleDefiningOid: aString
]

{ #category : #accessing }
ASN1Context >> typeNamed: aString [ 
	^ self factory typeNamed: aString
]
