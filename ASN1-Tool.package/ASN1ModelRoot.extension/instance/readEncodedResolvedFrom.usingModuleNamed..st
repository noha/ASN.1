*asn1-tool
readEncodedResolvedFrom: anObject usingModuleNamed: aString
	^ self readResolvedWith: [
		(self moduleNamed: aString) readEncodedFrom: anObject readStream ]