*asn1-tool
writeEncoded: anEncodedObject on: aStream usingType: aType
	(self codecStreamClass on: aStream) nextPut: (
		self 
			write: anEncodedObject
			usingType: aType)