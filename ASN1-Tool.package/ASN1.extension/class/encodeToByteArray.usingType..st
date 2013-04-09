*asn1-tool
encodeToByteArray: anEncodedObject usingType: aType
	^ ByteArray streamContents: [:stream|
		self 
			writeEncoded: anEncodedObject 
			on: stream
			usingType: aType]