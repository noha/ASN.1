Class {
	#name : #ASN1ObjectIdentifierType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1ObjectIdentifierType class >> decode: anArray [
	| objId next val |
	objId := OrderedCollection new.
	objId add: ((anArray first asInteger // 40) min: 2).
	objId add: anArray first asInteger - (objId last * 40).
	next := 2.
	val := 0.
	[ next <= anArray size ] whileTrue: [ | b |
		b := (anArray at: next) asInteger.
		next := next + 1.
		val := val bitOr: (b bitAnd: 127).
		((b bitAnd: 128) = 128)
			ifTrue: [ val := val bitShift: 7 ]
			ifFalse: [ 
				objId add: val.
				val := 0 ]
	].
	^ $. join: objId
	
]

{ #category : #codec }
ASN1ObjectIdentifierType class >> encode: anOidOrString [
	| components stream octets |
	octets := OrderedCollection new.
	components := ($. split: anOidOrString contents) collect: [:each| each asNumber ].
	"first octet is the combination of the first two components: (X * 40) + Y"
	components at: 1 put: (((components removeAt: 1) * 40) + components first).
	stream := components reverse readStream.
	[ stream atEnd ] whileFalse: [ | octet |
		octet := stream next.
		octets addFirst: (octet bitAnd: 127).
		[ octet > 127 ] whileTrue: [
			octet := octet bitShift: -7.
			octets addFirst: ((octet bitAnd: 127) bitOr: 128) ]].
	^octets asByteArray
	
]

{ #category : #accessing }
ASN1ObjectIdentifierType class >> universalType [
	^ 'OBJECT IDENTIFIER'
]

{ #category : #visiting }
ASN1ObjectIdentifierType >> accept: aVisitor [ 
	^ aVisitor visitObjectIdentifierType: self 
]

{ #category : #accessing }
ASN1ObjectIdentifierType >> asn1ValueClass [
	^ ASN1ObjectIdentifier
]

{ #category : #'as yet unclassified' }
ASN1ObjectIdentifierType >> printOn: aStream [
	aStream nextPutAll: 'OID'
]
