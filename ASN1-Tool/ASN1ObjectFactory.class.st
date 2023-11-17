Class {
	#name : #ASN1ObjectFactory,
	#superclass : #Object,
	#instVars : [
		'asn1Model'
	],
	#category : 'ASN1-Tool-Visitor'
}

{ #category : #accessing }
ASN1ObjectFactory >> asn1Model [
	^ asn1Model
]

{ #category : #accessing }
ASN1ObjectFactory >> asn1Model: aModel [
	asn1Model := aModel
]

{ #category : #accessing }
ASN1ObjectFactory >> moduleDefiningOid: anOid [
	^ self asn1Model moduleDefiningOid: anOid
]

{ #category : #accessing }
ASN1ObjectFactory >> newTypedCollection [
	^ ASN1AdaptiveTypeCollection new
]

{ #category : #creating }
ASN1ObjectFactory >> newValueForTypeNamed: aString [
	^ (self asn1Model typeNamed: aString) newValue
]

{ #category : #lookup }
ASN1ObjectFactory >> typeNamed: aString [ 
	^ self asn1Model typeNamed: aString
]
