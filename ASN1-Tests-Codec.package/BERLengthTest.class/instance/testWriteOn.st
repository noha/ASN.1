tests
testWriteOn
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
		contentLength: 172;
		writeOn: stream.
	self assert: stream contents = #(16r81 16rAC) asByteArray.

	stream := WriteStream on: ByteArray new.
	BERLength new
		definiteForm: true;
		contentLength: 435;
		writeOn: stream.
	self assert: stream contents = #(130 1 179) asByteArray.