as yet unclassified
testOperationDefinition
	| class |
	class := self astBindingValue: 'OPERATION' .
	self assert: class syntax size = 10