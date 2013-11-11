*asn1-tool
decodeTaggedValue: aTaggedValue 
	^ self type 
		decodeTaggedValue: aTaggedValue 
		tagEnvironment: self tagEnvironment  