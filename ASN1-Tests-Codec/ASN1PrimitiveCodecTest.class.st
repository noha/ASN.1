Class {
	#name : #ASN1PrimitiveCodecTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #'as yet unclassified' }
ASN1PrimitiveCodecTest >> roundTrip: aType value: anObject [ 
	| cls |
	cls := Smalltalk at: ('ASN1',aType,'Type') asSymbol.
	self assert: (cls decode: (cls encode: anObject)) = anObject
		
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeBMPString [
	self assert: (ASN1BMPStringType decode: #[0 104 0 97 0 108 0 108 0 111])  = 'hallo'
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeBitString [
	self assert: (ASN1BitStringType  decode: { 00 . 16r1. 16r2}) = '0000000100000010'.
	self assert: (ASN1BitStringType decode: { 01 . 16r80}) = '1000000'.
	self assert: (ASN1BitStringType decode: { 07 . 16r80}) = '1'.
	self assert: (ASN1BitStringType decode: { 0 }) = ''
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeBoolean [
	self assert: (ASN1BooleanType decode: #[16rFF]) = true.
	self assert: (ASN1BooleanType decode: #[16r23]) = true.
	self assert: (ASN1BooleanType decode: #[16r00]) = false.
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeGeneralizedTime [
	self assert: (ASN1GeneralizedTimeType decode: '19010101000000.123456Z') = (DateAndTime epoch + (Duration nanoSeconds: 123456000 )).
	self assert: (ASN1GeneralizedTimeType decode: '19010101020000.123456+0200') = ((DateAndTime epoch + (Duration nanoSeconds: 123456000 )) offset: 2 hours).

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeInteger [
	self assert: (ASN1IntegerType decode:  { 0 . 16r9B }) = 155
	
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeOctetString [
	| data |
	data := #[222 173 190 239].
	
	self assert: (ASN1OctetStringType decode: data) asByteArray hex = 'deadbeef'.
	"while ignoring bits zero should work"
	self assert: (ASN1OctetStringType decode: #[0]) = #[ 0 ]
	
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodePrintableString [
	self assert: (ASN1PrintableStringType decode: #[104 97 108 108 111])  = 'hallo'.
	self 
		should: [ ASN1PrintableStringType decode: #[104 97 108 108 111 64] ]
		raise: Error

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeUTCTime [
	self assert: (ASN1UTCTimeType decode: '010101000000Z') = (DateAndTime year: 2001 month: 1 day: 1 offset: 0 hours).
	self assert: (ASN1UTCTimeType decode: '700101000000Z') = (DateAndTime unixEpoch)
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeUTF8String [
	self assert: (ASN1UTF8StringType decode: #[97 115 99 105 105 32 197 139])  = ('ascii ', (Character value: 16r14B) asString)
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testDecodeUniversalString [
	self assert: (ASN1UniversalStringType decode: #[0 0 0 97 0 0 0 115 0 0 0 99 0 0 0 105 0 0 0 105 0 0 0 32 0 0 1 75]) = 
('ascii ', 16r14B asCharacter asString)
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeBMPString [
	self assert: (ASN1BMPStringType encode: 'hallo') = #[0 104 0 97 0 108 0 108 0 111].
	self assert: (ASN1BMPStringType encode: ('ascii ', (Character value: 16r14B) asString)) = #[0 97 0 115 0 99 0 105 0 105 0 32 1 75].
	


]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeBitString [
	self assert: (ASN1BitStringType encode: '10') = { 16r6 . 16r80 } asByteArray .
	"test a bit string that is a multiple of 8 if it does not encode an extra byte"
	self assert: (ASN1BitStringType encode: '00000010') = { 16r0 . 16r2 } asByteArray .
	self assert: (ASN1BitStringType encode: '00100000001') = { 16r5 . 16r20. 16r20 } asByteArray .
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeBoolean [
	self assert: (ASN1BooleanType encode: true) = #[16rFF].
	self assert: (ASN1BooleanType encode: false) = #[16r0].
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeGeneralizedTime [
	self assert: (ASN1GeneralizedTimeType encode: (DateAndTime epoch + (Duration nanoSeconds: 123456000 ))) = '19010101000000.123456Z'.
	self assert: (ASN1GeneralizedTimeType encode: ((DateAndTime epoch + (Duration nanoSeconds: 123456000 )) offset: 2 hours)) = '19010101020000.123456+0200'

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeInteger [
	self assert: (ASN1IntegerType encode:  0) = { 16r0 } asByteArray .
	self assert: (ASN1IntegerType encode:  -1) = { 16rff } asByteArray .
	self assert: (ASN1IntegerType encode:  -128) = { 16r80 } asByteArray .
	self assert: (ASN1IntegerType encode:  1) = { 16r01 } asByteArray .
	self assert: (ASN1IntegerType encode:  127) = { 16r7f } asByteArray .
	self assert: (ASN1IntegerType encode:  -32768) = { 16r80 . 16r00 } asByteArray .
	self assert: (ASN1IntegerType encode:  32767) = { 16r7f . 16rff } asByteArray .
	self roundTrip: #Integer value: 0.
	self assert: (ASN1IntegerType encode:  16909060) = { 1 . 2 . 3 . 4 } asByteArray .
	

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeOctetString [

	self assert: (ASN1OctetStringType encode: 'deadbeef') = #[100 101 97 100 98 101 101 102].	
	self assert: (ASN1OctetStringType encode: Character null asString) = #[0]
	
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeOid [
	| oid data |
	oid := '0.0.17.773.1.1.1'.
	data := ASN1ObjectIdentifierType encode:  oid.
	self assert: data = #[0 17 134 5 1 1 1]
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeOidSpec [
	| oid octets |
	oid := '2.100.3'.
	octets := ASN1ObjectIdentifierType encode: oid.
	self assert: octets = #[ 16r81 16r34 16r03 ]
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodePrintableString [
	self assert: (ASN1PrintableStringType encode: 'hallo') = #[104 97 108 108 111].
	self 
		should: [ ASN1PrintableStringType encode: 'hallo@'  ]
		raise: Error

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeUTCTime [
	self assert: (ASN1UTCTimeType encode: (DateAndTime epoch + (Duration nanoSeconds: 123456000 ))) = '010101000000Z'

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeUTF8String [
	self assert: (ASN1UTF8StringType encode: ('ascii ', 16r14B asCharacter asString)) = #[97 115 99 105 105 32 197 139]
.

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testEncodeUniversalString [
	self assert: (ASN1UniversalStringType encode: ('ascii ', 16r14B asCharacter asString)) = #[0 0 0 97 0 0 0 115 0 0 0 99 0 0 0 105 0 0 0 105 0 0 0 32 0 0 1 75]

]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testRoundtripBitString [
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '0000000100000010')) equals: '0000000100000010' .
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '1000000')) equals: '1000000' .
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '1')) equals: '1' 
]

{ #category : #tests }
ASN1PrimitiveCodecTest >> testRoundtripInteger [
	self roundTrip: #Integer value: 0.
	self roundTrip: #Integer value: 1.
	self roundTrip: #Integer value: -1.
	self roundTrip: #Integer value: 127.
	self roundTrip: #Integer value: -128.
	self roundTrip: #Integer value: 155.
	self roundTrip: #Integer value: 32767.
	self roundTrip: #Integer value: 16r7fff.
	self roundTrip: #Integer value: -16r8000.
	self roundTrip: #Integer value: 16r7fffffff.
	self roundTrip: #Integer value: -16r80000000.
	self roundTrip: #Integer value: 1431655765.
	self roundTrip: #Integer value: 16909060.
	self roundTrip: #Integer value: 2151727136.
	self roundTrip: #Integer value: 127.
	self roundTrip: #Integer value: -16909060.
	

	

]
