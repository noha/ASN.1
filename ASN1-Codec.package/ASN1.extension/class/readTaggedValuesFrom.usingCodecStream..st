*asn1-codec
readTaggedValuesFrom: aStream usingCodecStream: aClass
	^ (aClass on: aStream) next