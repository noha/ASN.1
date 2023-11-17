Class {
	#name : #ASN1ExplicitTags,
	#superclass : #ASN1TagEnvironment,
	#category : 'ASN1-Common'
}

{ #category : #testing }
ASN1ExplicitTags class >> isExplicit [ 
	^ true
]

{ #category : #accessing }
ASN1ExplicitTags class >> label [
	^ 'EXPLICIT'
]
