*asn1-codec
readTaggedValuesFrom: aStream
	^ self 
		readTaggedValuesFrom: aStream 
		usingCodecStream: self codecStreamClass 