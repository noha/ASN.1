*asn1-tool
encodeToByteArray: aValue usingType: aType
	^ ByteArray streamContents: [:stream|
		self 
			write: aValue 
			on: stream
			usingType: aType]