converting
asByteArray
	^ ByteArray streamContents: [:stream|
		(ASN1 codecStreamClass on: stream)
			nextPut: self ]