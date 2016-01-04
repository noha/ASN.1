accessing
type: anObject
	anObject isAsn1Node ifFalse: [ Error signal: 'type of reference node needs to be an ASN.1 object' ].
	self propertyAt: #type put: anObject