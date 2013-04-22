accessing
nextPut: anEncodedType
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