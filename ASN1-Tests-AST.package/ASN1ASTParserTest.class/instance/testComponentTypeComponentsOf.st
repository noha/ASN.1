tests
testComponentTypeComponentsOf
	| parsed |
	parsed := self parse: 'COMPONENTS OF Foodata' rule: #componentType.
	self assert: (parsed isAsn1Node).
	self assert: (parsed class = ASN1ComponentsOfNode )
