as yet unclassified
testErrorsParameter
	| object  |
	object := self astBindingValue: 'Errors' .
	self assert: object elementsSpec entity constraint object definition notNil