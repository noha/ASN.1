*asn1-tool
encodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment outerTag: aTag
	^ aTagEnvironment writeEncodedValue: aTaggedValue withTag: aTag