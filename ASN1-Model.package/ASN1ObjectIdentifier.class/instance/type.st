accessing
type
	^ type ifNil: [ 
		type := ASN1ObjectIdentifierType new ]