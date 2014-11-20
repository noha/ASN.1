visiting
visitExternalType: anExternalType
	| encoded module   |
	encoded := ASN1ConstructedTaggedValue new
		tag: anExternalType universalTag.
		
	encoded add: 	(ASN1ObjectIdentifierType new encodedValue: (currentValue oid)).
	
	module := (ASN1UnresolvedOid oid: currentValue oid) signal.
	encoded add:  (ASN1ConstructedTaggedValue new
		tag: (ASN1Tag new number: 0);
		add: (self class new
		write: currentValue value
		usingModule: module)) .
		
	^ encoded

