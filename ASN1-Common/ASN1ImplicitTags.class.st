Class {
	#name : #ASN1ImplicitTags,
	#superclass : #ASN1TagEnvironment,
	#category : 'ASN1-Common'
}

{ #category : #testing }
ASN1ImplicitTags class >> isExplicit [
	^ false
]

{ #category : #accessing }
ASN1ImplicitTags class >> label [
	^ 'IMPLICIT'
]
