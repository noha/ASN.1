Class {
	#name : #ASN1PrintableStringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1PrintableStringType class >> decode: anObject [
	| string |
	string := anObject asString.
	(string allSatisfy: [ :each | self validCharacters includes: each ]) ifFalse: [
		Error signal: string, ' is not a valid PrintableString' ].
	^ string
]

{ #category : #codec }
ASN1PrintableStringType class >> encode: aString [
	(aString allSatisfy: [ :each | self validCharacters includes: each ]) ifFalse: [
		Error signal: aString, ' is not a valid PrintableString' ].
	^aString asByteArray
]

{ #category : #accessing }
ASN1PrintableStringType class >> universalType [
	^ 'PrintableString'
]

{ #category : #accessing }
ASN1PrintableStringType class >> validCharacters [
	^ 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ''()+,-./:=?'
]

{ #category : #'as yet unclassified' }
ASN1PrintableStringType >> accept: aVisitor [
	^ aVisitor visitPrintableString: self
]
