Class {
	#name : #ASN1PrimitiveType,
	#superclass : #ASN1EncodedType,
	#instVars : [
		'tag'
	],
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1PrimitiveType class >> decode: aByteArray [
	self notYetImplemented 
]

{ #category : #codec }
ASN1PrimitiveType class >> encode: anObject [
	self notYetImplemented 
]

{ #category : #accessing }
ASN1PrimitiveType class >> withUniversalType: aString [ 
	^ self allSubclasses 
		detect: [ :cls | cls universalType = aString ]
		
]

{ #category : #accessing }
ASN1PrimitiveType >> asn1ValueClass [
	^ ASN1PrimitiveValue 
	
]

{ #category : #testing }
ASN1PrimitiveType >> isAsn1Primitive [ 
	^ true
]

{ #category : #validating }
ASN1PrimitiveType >> newBaseValue: aPrimitiveValue [ 
	(aPrimitiveValue type class = self class) ifFalse: [ Error signal: 'mismatch in type for existing base value' ].
	^ aPrimitiveValue 
]

{ #category : #'instance creation' }
ASN1PrimitiveType >> newValue: anObject [
	^ self newValue 
		contents: anObject
]

{ #category : #accessing }
ASN1PrimitiveType >> tag [
	^ tag ifNil: [
		tag := self universalTag ]
]

{ #category : #validating }
ASN1PrimitiveType >> validate: anObject [
	super validate: anObject
]
