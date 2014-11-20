as yet unclassified
testWriteNonExistingField
	| object |
	object := self object.
	self
		should: [ object at: #oof put: 'bar' ]
		raise: NotFound
