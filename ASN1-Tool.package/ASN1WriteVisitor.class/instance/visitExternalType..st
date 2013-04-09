as yet unclassified
visitExternalType: anExternalType
	| encoded module root external |
	encoded := ASN1ConstructedEncoding new
		tag: anExternalType universalTag.
		
	encoded add: 	(ASN1ObjectIdentifierType new encodedValue: (stack top oid)).
	
	module := ASN1CurrentContext value moduleDefiningOid: (stack top oid).
	encoded add:  (ASN1ConstructedEncoding new
		tag: (ASN1Tag new number: 0);
		add: (self class new
		write: stack top
		usingModule: module)) .
		
	^ encoded

