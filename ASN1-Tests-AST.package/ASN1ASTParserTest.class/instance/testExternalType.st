tests
testExternalType
	| parsed |
	parsed := self parse: 'EXTERNAL' rule: #externalType.
	self assert: parsed class = ASN1ExternalTypeNode.
	