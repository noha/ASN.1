*asn1-tool
readFrom: aStream inContext: aContext
	^ self
		readFrom: aStream readStream
		usingModule: self defaultModule
		inContext: aContext