Class {
	#name : #ASN1OctetStringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1OctetStringType class >> decode: aCollection [
	aCollection class == ByteArray ifFalse: [
		^ASN1InvalidValue signal: 'cannot apply value to type ', self universalType].
	^ aCollection 
]

{ #category : #codec }
ASN1OctetStringType class >> encode: anOctetString [
	"an octet string maps 1:1 from data to stream. "
	^ anOctetString asByteArray

]

{ #category : #accessing }
ASN1OctetStringType class >> universalType [
	^ 'OCTET STRING'
]

{ #category : #visiting }
ASN1OctetStringType >> accept: aVisitor [ 
	^ aVisitor visitOctetString: self
]

{ #category : #validating }
ASN1OctetStringType >> acceptsValue: anObject [
	^ (anObject class = ByteArray) or: [ anObject isByteString ]
]

{ #category : #accessing }
ASN1OctetStringType >> asn1ValueClass [
	^ ASN1OctetStringValue 
]

{ #category : #validating }
ASN1OctetStringType >> validate: aString [ 
	super validate: aString.
	((aString class = ByteArray) or: [ aString isByteString ]) ifFalse: [ 
		ASN1InvalidValue signal: 'cannot apply value ', aString asString, ' to type ', self class universalType  ]
]
