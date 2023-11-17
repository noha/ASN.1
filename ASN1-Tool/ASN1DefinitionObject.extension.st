Extension { #name : #ASN1DefinitionObject }

{ #category : #'*asn1-tool' }
ASN1DefinitionObject >> encodeToByteArray: anEncodedObject [
	^ ASN1 
		encodeToByteArray: anEncodedObject 
		usingType: self
]

{ #category : #'*asn1-tool' }
ASN1DefinitionObject >> read: anEncodedValue [
	^ ASN1 
		read: anEncodedValue
		usingType:  self
]

{ #category : #'*asn1-tool' }
ASN1DefinitionObject >> read: anEncodedValue as: aClass [
	^ ASN1 
		read: anEncodedValue
		usingType:  self
		inContext: self modelRoot
		as: aClass
]

{ #category : #'*asn1-tool' }
ASN1DefinitionObject >> readFrom: aStream [ 
	^ ASN1 
		readFrom: aStream
		usingType:  self
]

{ #category : #'*asn1-tool' }
ASN1DefinitionObject >> write: anEncodedObject [
	^ ASN1
		write: anEncodedObject  
		usingType: self
]
