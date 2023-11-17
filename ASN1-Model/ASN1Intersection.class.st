Class {
	#name : #ASN1Intersection,
	#superclass : #ASN1ElementCollection,
	#category : 'ASN1-Model'
}

{ #category : #testing }
ASN1Intersection >> includes: aType [
	^ elements allSatisfy: [ :each| each includes: aType ]
]
