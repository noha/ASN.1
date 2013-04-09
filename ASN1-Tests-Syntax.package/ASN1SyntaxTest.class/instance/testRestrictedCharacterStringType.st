tests
testRestrictedCharacterStringType
	self parse: 'IA5String' rule: #restrictedCharacterStringType.
	self parse: 'UTF8String' rule: #restrictedCharacterStringType.
	self parse: 'VisibleString' rule: #restrictedCharacterStringType.
