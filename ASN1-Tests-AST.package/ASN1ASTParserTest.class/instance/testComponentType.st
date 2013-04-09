tests
testComponentType
	| parsed |
	parsed := self parse: 'reroutingNumber    [0] IMPLICIT IsdnNumber' rule: #componentType.
	self assert: (parsed isAsn1Node).
