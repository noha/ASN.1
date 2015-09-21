as yet unclassified
shouldGetBasicTopPrimitive
	| val |
	val := self given: #shouldProvideValue.
	self assert: (val basicAt: #secondElement) value = 'hallo'.
	^ val