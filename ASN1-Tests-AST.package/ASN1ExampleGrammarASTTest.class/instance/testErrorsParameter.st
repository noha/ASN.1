as yet unclassified
testErrorsParameter
	| object  |
	object := self astBindingValue: 'Errors' .
	self assert: object elementsSpec elements first entity constraint object definition notNil 