*asn1-codec
readTaggedValuesFrom: aStream
	| taggedValue |
	taggedValue := self 
		readTaggedValuesFrom: aStream 
		usingCodecStream: self codecStreamClass.
	taggedValue hasError ifTrue: [ 
		ASN1SyntaxError new taggedValues: taggedValue; signal  ].
	^ taggedValue