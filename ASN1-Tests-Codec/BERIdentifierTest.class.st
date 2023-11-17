Class {
	#name : #BERIdentifierTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #'as yet unclassified' }
BERIdentifierTest >> testClazzNumber [
	self assert: (ASN1Tag clazz: 'UNIVERSAL' number: 10) clazzIdentifier = 0
]

{ #category : #'as yet unclassified' }
BERIdentifierTest >> testClazzNumberBogus [
	self should: [ (ASN1Tag clazz: 'ABC' number: 10) clazzIdentifier ] raise: Error
]

{ #category : #'as yet unclassified' }
BERIdentifierTest >> testParse [
	| identifier |
	identifier := BERIdentifier parseFrom: { 106 } readStream.
	self assert: identifier tag clazzIdentifier = 1.
	self assert: identifier isConstructed.
	self assert: identifier tag number = 10.
]

{ #category : #'as yet unclassified' }
BERIdentifierTest >> testParseExtendedNumber [
	| identifier |
	identifier := BERIdentifier parseFrom: { 63 . 129 . 3 } readStream.
	self assert: identifier tag clazzIdentifier = 0.
	self assert: identifier isConstructed.
	self assert: identifier tag number = 131.
]

{ #category : #'as yet unclassified' }
BERIdentifierTest >> testRoundTripExtended [
	| ident |

	ident := BERIdentifier parseFrom: #[159 34] readStream.
	self deny: ident isConstructed.
	self assert: ident tag clazzString equals: 'CONTEXT'.
	self assert: ident tag number equals: 34.
	self assert: (ByteArray streamContents: [:str | ident writeOn: str]) equals: #[159 34].

	ident := BERIdentifier parseFrom: #[159 180 57] readStream.
	self deny: ident isConstructed.
	self assert: ident tag clazzString equals: 'CONTEXT'.
	self assert: ident tag number equals: 6713.
	self assert: (ByteArray streamContents: [:str | ident writeOn: str]) equals: #[159 180 57].
]
