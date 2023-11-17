Extension { #name : #ASN1PrimitiveType }

{ #category : #'*asn1-tool' }
ASN1PrimitiveType >> decodedValue: aByteArray [
	^ self newValue: ( self class decode: aByteArray ) 
]

{ #category : #'*asn1-tool' }
ASN1PrimitiveType >> encodedValue: anObject [
	^ ASN1EncodedPrimitiveValue new 
		contents: (self class encode: anObject);
		tag: self universalTag		
]
