Class {
	#name : #BERStreamTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #'as yet unclassified' }
BERStreamTest >> assert: anObject hasTagClass: aClassNumber number: aNumber constructed: aBoolean [
	self assert: anObject tag clazz = aClassNumber .
	self assert: anObject tag number = aNumber.
	self assert: anObject isConstructed  = aBoolean.

]

{ #category : #'as yet unclassified' }
BERStreamTest >> assert: anObject hasTagClassNumber: aClassNumber number: aNumber constructed: aBoolean [
	self assert: anObject tag clazzIdentifier = aClassNumber .
	self assert: anObject tag number = aNumber.
	self assert: anObject isConstructed  = aBoolean.

]

{ #category : #'as yet unclassified' }
BERStreamTest >> assertTagClass: aClassNumber number: aNumber constructed: aBoolean [
	
]
