Extension { #name : #ASN1EncodedType }

{ #category : #'*asn1-tool' }
ASN1EncodedType >> decodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment [
	^ aTagEnvironment readEncodedValue: aTaggedValue
]

{ #category : #'*asn1-tool' }
ASN1EncodedType >> encodeTaggedValue: aTaggedValue tagEnvironment: aTagEnvironment outerTag: aTag [
	^ aTagEnvironment writeEncodedValue: aTaggedValue withTag: aTag
]
