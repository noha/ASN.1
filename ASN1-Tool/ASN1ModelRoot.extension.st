Extension { #name : #ASN1ModelRoot }

{ #category : #'*asn1-tool' }
ASN1ModelRoot >> read: aTaggedValue [
	^ self modules first 
		read: aTaggedValue
		inContext: self
]

{ #category : #'*asn1-tool' }
ASN1ModelRoot >> readFrom: anObject usingModule: aModule [
	^ aModule 
		readFrom: anObject readStream
		inContext: self 
]

{ #category : #'*asn1-tool' }
ASN1ModelRoot >> readFrom: anObject usingModule: aModule inContext: aContext [
	^ aModule 
		readFrom: anObject readStream
		inContext: aContext
]

{ #category : #'*asn1-tool' }
ASN1ModelRoot >> readFrom: anObject usingModuleNamed: aString [
	^ (self moduleNamed: aString)
		readFrom: anObject readStream
		inContext: self 
]

{ #category : #'*asn1-tool' }
ASN1ModelRoot >> resolveOidsWhile: aBlock [
	^ aBlock
		on: ASN1UnresolvedOid 
		do: [:err| 
			err resume: (self moduleDefiningOid: err oid)]
]
