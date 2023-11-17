Extension { #name : #PPParser }

{ #category : #'*asn1-ast' }
PPParser >> asn1Token [
	^ (ASN1TokenParser on: self)  ==> [:node| node inputValue ]
]
