as yet unclassified
testComplexChoice
	| type |
	type := self modelBindingValue: 'ComplexChoice'.
	self assert: type elements size = 4.
	self assert: type elements associations first value type elements size = 2.
