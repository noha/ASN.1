tests
testWriteLongDefiniteForm
	| array |
	array := ByteArray streamContents: [ :stream|
		(BERLength new  contentLength: 201) writeOn: stream ].
	self assert: array = #[129 201]