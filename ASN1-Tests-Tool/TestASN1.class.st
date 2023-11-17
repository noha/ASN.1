Class {
	#name : #TestASN1,
	#superclass : #ASN1,
	#category : 'ASN1-Tests-Tool'
}

{ #category : #'as yet unclassified' }
TestASN1 class >> writeVisitorClass [
	^ ASN1TestWriteVisitor 
]
