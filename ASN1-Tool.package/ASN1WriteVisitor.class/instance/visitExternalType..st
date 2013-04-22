as yet unclassified
visitExternalType: anExternalType
	| encoded module root external |
	encoded := ASN1ConstructedTaggedValue new
		tag: anExternalType universalTag.
		
	encoded add: 	(ASN1ObjectIdentifierType new encodedValue: (stack top oid)).
	
	module := (ASN1UnresolvedOid oid: stack top oid) signal.
	encoded add:  (ASN1ConstructedTaggedValue new
		tag: (ASN1Tag new number: 0);
		add: (self class new
		write: stack top
		usingModule: module)) .
		
	^ encoded
