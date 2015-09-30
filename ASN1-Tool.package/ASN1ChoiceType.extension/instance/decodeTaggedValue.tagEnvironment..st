*asn1-tool
decodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment
	"choices are always explicit"
	^ ASN1ExplicitTags readEncodedValue: aTaggedValue