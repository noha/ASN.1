Extension { #name : #ByteString }

{ #category : #'*asn1-model' }
ByteString >> byteArrayFromHex [
	^ ByteArray readHexFrom: (self size even 
		ifTrue: [ self ]
		ifFalse: [ '0',self ])
]
