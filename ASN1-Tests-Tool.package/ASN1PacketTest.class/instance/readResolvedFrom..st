accessing
readResolvedFrom: anObject
	^ self tcapModule readFrom: anObject readStream inContext: self asn1Model