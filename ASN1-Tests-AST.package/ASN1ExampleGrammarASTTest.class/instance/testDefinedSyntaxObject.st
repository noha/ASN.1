as yet unclassified
testDefinedSyntaxObject
	| obj |
	obj := self astBindingValue: 'mapSpecificAS' .
	self assert: (obj isValid).
