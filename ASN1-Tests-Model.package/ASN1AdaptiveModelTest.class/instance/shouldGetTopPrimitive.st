as yet unclassified
shouldGetTopPrimitive
	| val |
	val := self given: #shouldProvideValue.
	self assert: val secondElement = 'hallo' asByteArray.
	^ val