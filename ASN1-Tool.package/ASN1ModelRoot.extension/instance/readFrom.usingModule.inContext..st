*asn1-tool
readFrom: anObject usingModule: aModule inContext: aContext
	^ aModule 
		readFrom: anObject readStream
		inContext: aContext