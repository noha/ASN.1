tests
testEncodeOid
	| oid data |
	oid := '0.0.17.773.1.1.1'.
	data := ASN1ObjectIdentifierType encode:  oid.
	self assert: data = #[0 17 134 5 1 1 1]