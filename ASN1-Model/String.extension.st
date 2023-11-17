Extension { #name : #String }

{ #category : #'*asn1-model' }
String >> asAsn1Oid [
	^ ASN1ObjectIdentifier contents: self
]

{ #category : #'*asn1-model' }
String >> asAsn1Type [
	^ self asAsn1TypeIn: ASN1CurrentContext value
]

{ #category : #'*asn1-model' }
String >> asAsn1TypeIn: aContext [
	^ (aContext typeNamed: self) 
		ifNil: [ NotFound signal: 'cannot find type ', self ]
]

{ #category : #'*asn1-model' }
String >> asAsn1ValueTypedIn: aContext [
	^ (self asAsn1TypeIn: aContext) newValue
]

{ #category : #'*asn1-model' }
String >> asn1Denormalized [
	^ self replaceAll: $_ with: $-
]

{ #category : #'*asn1-model' }
String >> asn1Normalized [
	^ self replaceAll: $- with: $_
]

{ #category : #'*asn1-model' }
String >> asn1TypeClass [
	^ ASN1OctetStringType 
]
