Extension { #name : #ASN1TaggedType }

{ #category : #'*asn1-tool' }
ASN1TaggedType >> encodeTaggedValue: aTaggedValue [ 
	"a tagged type consists of an inner tag and an outer tag. While encoding
	the tag environment indicates if both tags are encoded (explicit) or if 
	the outer tag overwrites the inner tag (implicit)"
	^ type 
		encodeTaggedValue: aTaggedValue 
		tagEnvironment: self tagEnvironment 
		outerTag: tag
]

{ #category : #'*asn1-tool' }
ASN1TaggedType >> readEncodedValue: aTaggedValue [ 
	^ self type 
		decodeTaggedValue: aTaggedValue 
		tagEnvironment: self tagEnvironment  
]
