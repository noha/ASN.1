as yet unclassified
testRelativeOidResolving
	| type |
	type := self modelBindingValue:  'map-DialogueAS'.
	self assert: type string = '0.4.0.0.1.1.1.1'