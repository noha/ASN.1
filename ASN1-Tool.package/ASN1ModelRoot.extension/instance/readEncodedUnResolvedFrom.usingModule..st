*asn1-tool
readEncodedUnResolvedFrom: anObject usingModule: aModule
	^ self readNoResolvingWith: [
		aModule readFrom: anObject readStream ]