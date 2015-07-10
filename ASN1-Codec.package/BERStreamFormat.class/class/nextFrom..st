reading
nextFrom: aStream
	^ aStream next ifNil: [ 
		ASN1PrematureEndOfStream signal ]