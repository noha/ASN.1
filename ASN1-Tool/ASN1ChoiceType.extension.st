Extension { #name : #ASN1ChoiceType }

{ #category : #'*asn1-tool' }
ASN1ChoiceType >> decodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment [
	"choices are always explicit"
	^ ASN1ExplicitTags readEncodedValue: aTaggedValue
]

{ #category : #'*asn1-tool' }
ASN1ChoiceType >> encodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment outerTag: aTag [
	"choices are always explicit"

	^ ASN1ExplicitTags writeEncodedValue: aTaggedValue withTag: aTag
]
