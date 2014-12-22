tests
testAddElementToTypedCollection
	| col |
	col := self typedCollection.
	col addUsing: [ :object | object foo: 'bar'].
	self assert: col first foo = 'bar'
	