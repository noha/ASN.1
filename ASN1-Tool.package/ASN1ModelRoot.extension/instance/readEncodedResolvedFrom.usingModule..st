*asn1-tool
readEncodedResolvedFrom: anObject usingModule: aModule
	^ self readResolvedWith: [
		aModule readEncodedFrom: anObject readStream ]