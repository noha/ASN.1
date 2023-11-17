Class {
	#name : #ASN1UniversalStringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1UniversalStringType class >> decode: aByteArray [
	| byteStream |
	byteStream := aByteArray readStream.
	^ String streamContents: [ :stream | 
		[ byteStream atEnd ] whileFalse: [  
			stream nextPut: (Character value: (byteStream next: 4) asInteger) ] ]
]

{ #category : #codec }
ASN1UniversalStringType class >> encode: aString [
	^ ByteArray streamContents: [ :stream |
		 aString do: [ :character |
			(character asciiValue <= 16rFF) ifTrue: [ stream nextPut: 0].
			(character asciiValue <= 16rFFFF) ifTrue: [ stream nextPut: 0].
			(character asciiValue <= 16rFFFFFF) ifTrue: [ stream nextPut: 0].
			stream nextPutAll: character asciiValue asByteArray ]]
			
]

{ #category : #accessing }
ASN1UniversalStringType class >> universalType [
	^ 'UniversalString'
]

{ #category : #'as yet unclassified' }
ASN1UniversalStringType >> accept: aVisitor [
	^ aVisitor visitPrintableString: self
]
