Class {
	#name : #BERLengthTest,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #tests }
BERLengthTest >> testReadLongDefiniteForm [
	| length |
	length := (BERLength parseFrom: { 130 . 1 . 2 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 258. 

	length := (BERLength parseFrom: { 16r81. 16r7F } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 127.

	length := (BERLength parseFrom: { 16r81. 16r80 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 128.
]

{ #category : #tests }
BERLengthTest >> testReadLongIndefiniteForm [
	| length |

	length := (BERLength parseFrom: { 128 } readStream).
	self assert: length hasDefiniteForm = false.
	self assert: length contentLength = nil.

	length := (BERLength parseFrom: { 127 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 127.
	

]

{ #category : #tests }
BERLengthTest >> testReadLongIndefiniteFormContent [
	| length value |
	length := (BERLength parseFrom: { 128 } readStream).
	value := length readFrom: { 1 . 2 . 3. 0. 0 } readStream.
	self assert: value = #[ 1  2  3 ]
]

{ #category : #tests }
BERLengthTest >> testReadShortForm [
	| length |
	length := (BERLength parseFrom: { 38 } readStream).
	self assert: length hasDefiniteForm = true.
	self assert: length contentLength = 38. 
]

{ #category : #tests }
BERLengthTest >> testWriteLongDefiniteForm [
	| array |
	array := ByteArray streamContents: [ :stream|
		(BERLength new  contentLength: 201) writeOn: stream ].
	self assert: array = #[129 201].

	array := ByteArray streamContents: [ :stream|
		(BERLength new  contentLength: 127) writeOn: stream ].
	self assert: array = #[127].

	array := ByteArray streamContents: [ :stream|
		(BERLength new  contentLength: 128) writeOn: stream ].
	self assert: array = #[129 128]
]

{ #category : #tests }
BERLengthTest >> testWriteOn [
	| stream |
	"Test writing definitive form with a single byte and multi byte"

	stream := WriteStream on: ByteArray new.
	BERLength new
		definiteForm: true;
		contentLength: 16r23;
		writeOn: stream.
	self assert: stream contents = #(16r23) asByteArray.                                                
	stream := WriteStream on: ByteArray new.
	BERLength new
		definiteForm: true;
		contentLength: 127;
		writeOn: stream.
	self assert: stream contents = #(16r7f) asByteArray.

	stream := WriteStream on: ByteArray new.
	BERLength new
		definiteForm: true;
		contentLength: 128;
		writeOn: stream.
	self assert: stream contents = #(16r81 16r80) asByteArray.  

	stream := WriteStream on: ByteArray new.
	BERLength new
		definiteForm: true;
		contentLength: 172;
		writeOn: stream.
	self assert: stream contents = #(16r81 16rAC) asByteArray.

	stream := WriteStream on: ByteArray new.
	BERLength new
		definiteForm: true;
		contentLength: 435;
		writeOn: stream.
	self assert: stream contents = #(130 1 179) asByteArray.
]
