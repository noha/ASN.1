*asn1-codec
readTaggedValuesFrom: aStream
	| taggedValue |
	taggedValue := self 
		readTaggedValuesFrom: aStream 
		usingCodecStream: self codecStreamClass.
	taggedValue hasError ifTrue: [ 
		ASN1TaggedValueError new taggedValues: taggedValue; signal  ].
	^ taggedValue