*asn1-tool
readEncodedResolvedFrom: anObject usingModuleNamed: aString
	^ self resolveOidsWhile: [
		(self moduleNamed: aString) readFrom: anObject readStream ]