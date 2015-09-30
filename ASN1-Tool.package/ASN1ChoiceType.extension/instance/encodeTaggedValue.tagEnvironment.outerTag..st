*asn1-tool
encodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment outerTag: aTag
	"choices are always explicit"

	^ ASN1ExplicitTags writeEncodedValue: aTaggedValue withTag: aTag