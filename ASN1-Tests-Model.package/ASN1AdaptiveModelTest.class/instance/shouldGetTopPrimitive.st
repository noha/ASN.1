as yet unclassified
shouldGetTopPrimitive
	| val |
	val := self given: #shouldProvideValue.
	self assert: val secondElement = 'hallo'.
	^ val