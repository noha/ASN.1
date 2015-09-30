*asn1-tool
writeEncodedValues: aTaggedValue on: aStream 
	(self codecStreamClass on: aStream) nextPut: aTaggedValue