accessing
encodingReferenceDefault
	^ encodingReferenceDefault ifNil: [
		encodingReferenceDefault := ASN1TagEncodingReference new ]