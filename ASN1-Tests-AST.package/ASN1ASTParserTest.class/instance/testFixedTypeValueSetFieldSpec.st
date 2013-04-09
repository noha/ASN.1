tests
testFixedTypeValueSetFieldSpec
	| parsed |
	parsed := self parse: '&Errors   ERROR OPTIONAL' rule: #fixedTypeValueSetFieldSpec.
	self assert: parsed class = ASN1FieldSpecNode.
	self assert: parsed type label = 'ERROR'.
	self assert: parsed isOptional.
	