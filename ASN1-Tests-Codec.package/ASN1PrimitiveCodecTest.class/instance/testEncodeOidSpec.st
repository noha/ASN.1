as yet unclassified
testEncodeOidSpec
	| oid octets |
	oid := '2.100.3'.
	octets := ASN1PrimitiveCodec encodeObjectIdentifier: oid.
	self assert: octets = #[ 16r81 16r34 16r03 ]