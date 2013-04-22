*asn1-tool
writeTaggedValues: aTaggedValue on: aStream 
	(self codecStreamClass on: aStream) nextPut: aTaggedValue