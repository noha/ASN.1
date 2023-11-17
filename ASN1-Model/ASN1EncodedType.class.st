Class {
	#name : #ASN1EncodedType,
	#superclass : #ASN1TypeObject,
	#instVars : [
		'tagEnvironment'
	],
	#classVars : [
		'tagNumbers'
	],
	#classInstVars : [
		'universalTag'
	],
	#category : 'ASN1-Model'
}

{ #category : #'as yet unclassified' }
ASN1EncodedType class >> buildUniversalTag [

	^ ASN1Tag new
		clazz: 'UNIVERSAL';
		number: self tagNumber
]

{ #category : #'as yet unclassified' }
ASN1EncodedType class >> createUniversalTagNumberMap [
	^ (Dictionary new)
		at: 'BOOLEAN' put: 1;
		at: 'INTEGER' put: 2;
		at: 'BIT STRING' put: 3;
		at: 'OCTET STRING' put: 4;
		at: 'NULL' put: 5;
		at: 'OBJECT IDENTIFIER' put: 6;

		at: 'OPEN TYPE' put: 8;
		at: 'EXTERNAL TYPE' put: 8;
		at: 'ENUMERATED' put: 10;
		at: 'SEQUENCE' put: 16;
		at: 'SET' put: 17;
		at: 'NumericString' put: 18;
		at: 'PrintableString' put: 19;
		at: 'TeletexString' put: 20;
		at: 'UTCTime' put: 23;
		at: 'IA5String' put: 27;
		yourself.
]

{ #category : #'as yet unclassified' }
ASN1EncodedType class >> resetUniversalTagNumbers [
	tagNumbers := nil
]

{ #category : #accessing }
ASN1EncodedType class >> tagNumber [
	^ self universalTagNumbers at: self universalType 
]

{ #category : #'as yet unclassified' }
ASN1EncodedType class >> universalTag [
	^ universalTag ifNil: [
		universalTag := self buildUniversalTag ]
]

{ #category : #'as yet unclassified' }
ASN1EncodedType class >> universalTagNumbers [
	^  tagNumbers ifNil: [
		tagNumbers := self createUniversalTagNumberMap ]
]

{ #category : #testing }
ASN1EncodedType >> includesTag: aTag [
	^ self tag = aTag
]

{ #category : #accessing }
ASN1EncodedType >> tagEnvironment [
	^ tagEnvironment ifNil: [
		tagEnvironment := self module tagEnvironment ]
]

{ #category : #accessing }
ASN1EncodedType >> tagEnvironment: anObject [
	tagEnvironment := anObject
]

{ #category : #accessing }
ASN1EncodedType >> universalTag [
	^ self class universalTag 
]
