decoding
decodeOctetString: aCollection
	^ aCollection asByteArray hex asUppercase 