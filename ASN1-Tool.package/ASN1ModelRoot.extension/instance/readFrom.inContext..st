*asn1-tool
readFrom: anObject inContext: aContext
	^ self modules first 
		readFrom: anObject readStream
		inContext: aContext