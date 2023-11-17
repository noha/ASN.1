"
I am a Tag Value Length (TLV) Stream for Basic Encoding Rules (BER)
of X.690 and provide very basic reading of a stream.
"
Class {
	#name : #BERTLVStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'definiteForm'
	],
	#category : 'ASN1-Codec-BER'
}

{ #category : #creation }
BERTLVStream class >> on: aStream [
        ^ self new
            stream: aStream;
            yourself

]

{ #category : #accessing }
BERTLVStream >> atEnd [
        ^ stream atEnd

]

{ #category : #accessing }
BERTLVStream >> beIndefinite [
	definiteForm := false
]

{ #category : #accessing }
BERTLVStream >> flush [
	stream flush
]

{ #category : #'initialize-release' }
BERTLVStream >> initialize [ 
	super initialize.
	definiteForm := true
]

{ #category : #accessing }
BERTLVStream >> next [
	^ [ self nextTaggedValue ]
		on: ASN1PrematureEndOfStream 
		do: [ :error | ASN1EncodedError new ]
]

{ #category : #accessing }
BERTLVStream >> nextAll [
	| ret |
        ret := OrderedCollection new.

        [self atEnd] whileFalse: [ret add: self next].

        ^ ret

]

{ #category : #accessing }
BERTLVStream >> nextByte [
	^ stream next
]

{ #category : #accessing }
BERTLVStream >> nextPut: anEncodedType [
	| length array |
	(BERIdentifier new
		tag: anEncodedType tag;
		constructed: anEncodedType isConstructed)
			writeOn: stream.
	array := ByteArray streamContents: [:str|
		anEncodedType writeOn: (BERTLVStream on: str).
		definiteForm ifFalse: [
			str nextPutAll: #[ 0 0 ] ] ].
	(BERLength new
		definiteForm: definiteForm;
		contentLength: array size)
			writeOn: stream.
	stream nextPutAll: array
]

{ #category : #accessing }
BERTLVStream >> nextPutConstructed: aConstructedTaggedValue [
	aConstructedTaggedValue do: [:each|
		self nextPut: each ]
]

{ #category : #accessing }
BERTLVStream >> nextPutPrimitive: aPrimitiveTaggedValue [
	aPrimitiveTaggedValue hasContent ifTrue: [
		stream nextPutAll: aPrimitiveTaggedValue contents asByteArray ]
]

{ #category : #accessing }
BERTLVStream >> nextTaggedValue [
	| identifier length clazz source |
	identifier := self readIdentifier.
	length := self readLength.
	
	clazz := identifier isConstructed 
		ifTrue: [ ASN1EncodedConstructedValue ]
		ifFalse: [ ASN1EncodedPrimitiveValue ].

	source := length hasDefiniteForm 
		ifTrue: [ | value |
			value := length readFrom: stream.
			value isCollection
				ifTrue: [ value ]
				ifFalse: [ ^ value ] ]
		ifFalse: [  stream  ].
	^ (clazz newFrom: source)
		tag: identifier tag
]

{ #category : #accessing }
BERTLVStream >> peek [
	^ stream peek
]

{ #category : #accessing }
BERTLVStream >> readIdentifier [
	^ BERIdentifier parseFrom: stream.
]

{ #category : #accessing }
BERTLVStream >> readLength [
	^ BERLength parseFrom: stream.
]

{ #category : #accessing }
BERTLVStream >> stream: aStream [
        stream := aStream.

]
