as yet unclassified
testSimpleChoice
	| type |
	type := self astBindingValue: 'SimpleChoice'.
	self assert: type elements size = 2.