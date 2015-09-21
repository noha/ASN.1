as yet unclassified
shouldGetBottomPrimitiveInteger
	| val |
	val := self given: #shouldProvideValue.
	self assert: val firstElement secondElement = 112.
	^ val