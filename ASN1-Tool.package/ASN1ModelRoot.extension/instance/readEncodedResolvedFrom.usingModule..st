*asn1-tool
readEncodedResolvedFrom: anObject usingModule: aModule
	^ self resolveOidsWhile: [
		aModule readFrom: anObject readStream ]