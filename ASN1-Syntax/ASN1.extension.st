Extension { #name : #ASN1 }

{ #category : #'*asn1-syntax' }
ASN1 class >> parseSyntax: aStringOrStream [
	^ ASN1Syntax parse: aStringOrStream 
]
