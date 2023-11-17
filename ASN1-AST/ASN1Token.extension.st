Extension { #name : #ASN1Token }

{ #category : #'*asn1-ast' }
ASN1Token >> asn1Reference [
	^ ASN1ReferenceNode new
		label: self value
]
