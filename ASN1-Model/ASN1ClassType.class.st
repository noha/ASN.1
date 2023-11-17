Class {
	#name : #ASN1ClassType,
	#superclass : #ASN1TypeObject,
	#category : 'ASN1-Model'
}

{ #category : #visiting }
ASN1ClassType >> accept: aVisitor [ 
	^ aVisitor visitClass: self
]
