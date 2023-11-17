Class {
	#name : #ASN1TeletexStringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1TeletexStringType class >> decode: aByteArray [
	self flag: #needsRedsign.
	"decode as latin-1 although teletex is encoded with T.61"
	^ aByteArray asString convertFromEncoding: 'latin-1'
]

{ #category : #codec }
ASN1TeletexStringType class >> encode: aString [
	self flag: #needsRedesign.
	"this is a quick hack to enable teletex strings. The string is not really latin-1 encoding"
	^ aString convertToEncoding: 'latin-1'
]

{ #category : #accessing }
ASN1TeletexStringType class >> universalType [
	^ 'TeletexString'
]

{ #category : #'as yet unclassified' }
ASN1TeletexStringType >> accept: aVisitor [
	^ aVisitor visitTeletexString: self
]
