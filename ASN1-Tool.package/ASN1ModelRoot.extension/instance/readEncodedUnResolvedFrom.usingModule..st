*asn1-tool
readEncodedUnResolvedFrom: anObject usingModule: aModule
	^ self readNoResolvingWith: [
		aModule readEncodedFrom: anObject readStream ]