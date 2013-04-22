*asn1-tool
encodeToByteArray: anEncodedObject usingType: aType
	^ ByteArray streamContents: [:stream|
		self 
			write: anEncodedObject 
			on: stream
			usingType: aType]