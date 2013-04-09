as yet unclassified
testOperationInstantiation
	| object  |
	object := self astBindingValue: 'purgeMS' .
	self assert: ( object syntax size = 8).
