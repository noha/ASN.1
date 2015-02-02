codec
encode: aString
	^(aString convertToEncoding: 'utf-8') asByteArray 