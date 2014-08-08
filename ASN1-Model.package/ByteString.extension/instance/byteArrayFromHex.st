*asn1-model
byteArrayFromHex
	^ ByteArray readHexFrom: (self size even 
		ifTrue: [ self ]
		ifFalse: [ '0',self ])