as yet unclassified
testReadExistingFieldNoValue
	| object |
	object := self object.
	self assert: object foo isNil
