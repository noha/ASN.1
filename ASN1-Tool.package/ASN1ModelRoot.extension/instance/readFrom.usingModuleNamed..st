*asn1-tool
readFrom: anObject usingModuleNamed: aString
	^ (self moduleNamed: aString)
		readFrom: anObject readStream
		inContext: self 