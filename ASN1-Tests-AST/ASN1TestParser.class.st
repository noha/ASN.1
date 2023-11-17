Class {
	#name : #ASN1TestParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'foo',
		'fooToken',
		'fooDoubleToken'
	],
	#category : 'ASN1-Tests-AST'
}

{ #category : #accessing }
ASN1TestParser >> foo [
	^ 'foo' asParser
]

{ #category : #accessing }
ASN1TestParser >> fooDoubleToken [
	^ fooToken asn1Token
]

{ #category : #accessing }
ASN1TestParser >> fooToken [
	^ foo asn1Token
]

{ #category : #accessing }
ASN1TestParser >> start [
	^ foo end
]
