*asn1-tool
readFrom: aStream usingType: aType 
	^ self  
		readFrom: aStream
		usingType: aType
		inContext: nil
