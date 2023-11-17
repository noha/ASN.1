Extension { #name : #ASN1ImplicitTags }

{ #category : #'*asn1-tool' }
ASN1ImplicitTags class >> readEncodedValue: anEncodedValue [ 
	^ anEncodedValue
]

{ #category : #'*asn1-tool' }
ASN1ImplicitTags class >> writeEncodedValue: aEncodedValue withTag: aTag [ 
	"in an implicit tag environment the outer tag overwrites the
	inner tag "
	^ aEncodedValue tag: aTag
]
