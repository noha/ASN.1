Class {
	#name : #ASN1UnresolvedOid,
	#superclass : #Exception,
	#instVars : [
		'oid'
	],
	#category : 'ASN1-Model-Exception'
}

{ #category : #accessing }
ASN1UnresolvedOid class >> oid: aString [
	^ self new
		oid: aString
		
]

{ #category : #accessing }
ASN1UnresolvedOid >> defaultAction [
	UnhandledError signalForException: self
]

{ #category : #accessing }
ASN1UnresolvedOid >> oid [
	^ oid
]

{ #category : #accessing }
ASN1UnresolvedOid >> oid: aString [
	oid := aString
]

{ #category : #printing }
ASN1UnresolvedOid >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: Character space.
	oid printOn: aStream
]
