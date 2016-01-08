tests
testFixedTypeValueFieldSpec
	| parsed |
	parsed := self parse: '&componentGrouping    BOOLEAN DEFAULT TRUE' rule: #fixedTypeValueFieldSpec.
	self assert: parsed class = ASN1FieldSpecNode.
	self assert: parsed type name = 'BOOLEAN'.
	self assert: parsed hasDefaultValue.
	self assert: parsed defaultValue type class = ASN1BooleanTypeNode .
	self assert: parsed defaultValue value = 'TRUE'.
