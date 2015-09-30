*asn1-tool
readEncodedValue: aTaggedValue 
	^ self type 
		decodeTaggedValue: aTaggedValue 
		tagEnvironment: self tagEnvironment  