*asn1-ast
asn1Token
	^ (ASN1TokenParser on: self)  ==> [:node| node value ]