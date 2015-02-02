as yet unclassified
testObjectIdentifierOnlyNumbers
	| type |
	type := self astBindingValue: 'id-domainComponent'.
	self assert: (type oidString = '0.9.2342.19200300.100.1.25')