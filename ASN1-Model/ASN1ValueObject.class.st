Class {
	#name : #ASN1ValueObject,
	#superclass : #ASN1DefinitionObject,
	#instVars : [
		'type'
	],
	#category : 'ASN1-Model'
}

{ #category : #'instance creation' }
ASN1ValueObject class >> asAsn1ValueIn: aType [
	^ self newIn: aType
]

{ #category : #'instance creation' }
ASN1ValueObject class >> newIn: aContext [

	^ (aContext typeNamed: self asn1TypeName) newValue
]

{ #category : #converting }
ASN1ValueObject >> asExternalValue: anOid [
	^ ASN1AdaptiveTypeExternal new
		oid: anOid;
		value: self
]

{ #category : #converting }
ASN1ValueObject >> basicEncodeToByteArray [
	^ ByteArray streamContents: [ :stream | 
		self writeEncodedValuesOn: stream ]
]

{ #category : #converting }
ASN1ValueObject >> encodeToByteArray [
	^ self modelRoot resolveOidsWhile: [ 
		self basicEncodeToByteArray ]
]

{ #category : #initialize }
ASN1ValueObject >> initializeFrom: anObject [ 
	
]

{ #category : #testing }
ASN1ValueObject >> isAsn1Value [
	^ true
]

{ #category : #testing }
ASN1ValueObject >> matchesType: aType [
	^ self isKindOf: aType asn1ValueClass 
]

{ #category : #'as yet unclassified' }
ASN1ValueObject >> modelRoot [
	^ type modelRoot
]

{ #category : #accessing }
ASN1ValueObject >> type [
	^ type
]

{ #category : #accessing }
ASN1ValueObject >> type: anObject [
	type := anObject
]

{ #category : #validating }
ASN1ValueObject >> validate [
]

{ #category : #validating }
ASN1ValueObject >> validateVisitor [
	^ ASN1ValidatingVisitor new
		validate: self 
	
]

{ #category : #converting }
ASN1ValueObject >> writeEncodedValuesOn: aStream [
	^ ASN1
		write: self 
		on: aStream
		usingType: type
]
