*asn1-tool
readFrom: aStream
	^ self
		readFrom: aStream readStream
		usingModule: self defaultModule