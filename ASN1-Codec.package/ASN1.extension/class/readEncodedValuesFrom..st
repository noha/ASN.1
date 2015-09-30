*asn1-codec
readEncodedValuesFrom: aStream
	| encodedValue |
	encodedValue := self 
		readEncodedValuesFrom: aStream 
		usingCodecStream: self codecStreamClass.
	encodedValue hasError ifTrue: [ 
		ASN1EncodedValueError new encodedValue: encodedValue; signal  ].
	^ encodedValue