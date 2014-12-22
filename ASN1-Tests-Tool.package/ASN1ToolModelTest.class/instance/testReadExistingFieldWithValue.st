tests
testReadExistingFieldWithValue
	| object |
	object := self object.
	object at: #foo put: 2.
	self assert: object foo notNil
