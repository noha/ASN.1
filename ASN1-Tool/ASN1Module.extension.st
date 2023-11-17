Extension { #name : #ASN1Module }

{ #category : #'*asn1-tool' }
ASN1Module >> encodeToByteArray: anObject [
	^ ASN1 
		encodeToByteArray: anObject 
		usingType: self pdu
]

{ #category : #'*asn1-tool' }
ASN1Module >> read: aTaggedValue [
	^ self read: aTaggedValue inContext: nil
]

{ #category : #'*asn1-tool' }
ASN1Module >> read: aTaggedValue inContext: aContext [
	^ ASN1
		read: aTaggedValue
		usingType:  self pdu
		inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1Module >> readFrom: aStream [
	^ self readFrom: aStream inContext: nil
]

{ #category : #'*asn1-tool' }
ASN1Module >> readFrom: aStream inContext: aContext [
	^ ASN1
		readFrom: aStream
		usingType:  self pdu
		inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1Module >> write: anObject [
	^ ASN1
		write: anObject  
		usingType:  self pdu
]

{ #category : #'*asn1-tool' }
ASN1Module >> write: anObject on: aStream [
	^ASN1
		write: anObject 
		on: aStream 
		usingType: self pdu
]
