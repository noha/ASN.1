Extension { #name : #ASN1ExplicitTags }

{ #category : #'*asn1-tool' }
ASN1ExplicitTags class >> readEncodedValue: anEncodedValue [ 
	^ anEncodedValue firstElement
]

{ #category : #'*asn1-tool' }
ASN1ExplicitTags class >> writeEncodedValue: anEncodedValue withTag: aTag [ 
	"in explicit mode we add another tag around the current tagged value"
	^ ASN1EncodedConstructedValue new
		add: anEncodedValue;
		tag: aTag;
		yourself
]
