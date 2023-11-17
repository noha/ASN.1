Class {
	#name : #ASN1Union,
	#superclass : #ASN1ElementCollection,
	#category : 'ASN1-Model'
}

{ #category : #testing }
ASN1Union >> includes: aType [
	^ elements anySatisfy: [ :each| each includes: aType ]
]
