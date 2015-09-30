converting
writeEncodedValuesOn: aStream
	^ ASN1
		write: self 
		on: aStream
		usingType: type