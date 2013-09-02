*asn1-tool
readResolvedFrom: anObject
	^ self resolveOidsWhile: [ 
		self readFrom: anObject readStream ]
