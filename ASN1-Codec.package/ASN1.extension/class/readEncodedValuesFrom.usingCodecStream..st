*asn1-codec
readEncodedValuesFrom: aStream usingCodecStream: aClass
	^ (aClass on: aStream) next