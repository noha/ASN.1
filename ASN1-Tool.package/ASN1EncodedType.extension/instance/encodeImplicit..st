*asn1-tool
encodeImplicit: anEncodedObject
	self explicitTag ifNotNil: [:tag|
		anEncodedObject tag:  tag ].
	^ anEncodedObject 