Extension { #name : #ByteArray }

{ #category : #'*asn1-model' }
ByteArray >> asAsn1HexString [
	^ self asByteArray hex asUppercase
]

{ #category : #'*asn1-model' }
ByteArray >> asn1TypeClass [
	^ ASN1OctetStringType 
]
