tests
testChoiceValue
	| parsed |
	parsed := self parse: 'noInvokeId InvokeId ::= absent:NULL' rule: #assignmentList.
	self assert: parsed first right class = ASN1ChoiceValueNode.
 