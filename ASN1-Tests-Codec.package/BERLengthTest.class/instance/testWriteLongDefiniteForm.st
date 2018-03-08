tests
testWriteLongDefiniteForm
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