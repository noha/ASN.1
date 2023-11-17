Class {
	#name : #ASN1TagEnvironment,
	#superclass : #Object,
	#category : 'ASN1-Common'
}

{ #category : #accessing }
ASN1TagEnvironment class >> labelled: aString [
	^ self subclasses 
		detect: [:cls| cls label = aString ]
]
