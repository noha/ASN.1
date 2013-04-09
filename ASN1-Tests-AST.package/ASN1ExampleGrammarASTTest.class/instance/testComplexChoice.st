as yet unclassified
testComplexChoice
	| type |
	type := self astBindingValue: 'ComplexChoice'.
	self assert: type elements size = 4.
