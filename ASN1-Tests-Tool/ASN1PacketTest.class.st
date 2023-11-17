Class {
	#name : #ASN1PacketTest,
	#superclass : #TestCase,
	#instVars : [
		'asn1'
	],
	#category : 'ASN1-Tests-Tool'
}

{ #category : #accessing }
ASN1PacketTest >> readFrom: anObject [
	^ self tcapModule readFrom: anObject readStream inContext: self asn1Model
]

{ #category : #accessing }
ASN1PacketTest >> readResolvedFrom: anObject [
	^ self tcapModule readFrom: anObject readStream inContext: self asn1Model
]

{ #category : #'as yet unclassified' }
ASN1PacketTest >> roundTripTestFor: anObject [
	| object data  |
	self asn1Model resolveOidsWhile: [
		object := self readResolvedFrom: anObject.
		data := ASN1
			encodeToByteArray: object
			usingModule: self tcapModule ].
	self assert: data = anObject
]
