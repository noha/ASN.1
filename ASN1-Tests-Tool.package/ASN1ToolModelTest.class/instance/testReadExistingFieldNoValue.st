tests
testReadExistingFieldNoValue
	| object |
	object := self object.
	self assert: object foo isNil
