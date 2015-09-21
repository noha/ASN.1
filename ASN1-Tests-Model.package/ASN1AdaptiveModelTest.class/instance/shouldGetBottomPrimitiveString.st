as yet unclassified
shouldGetBottomPrimitiveString
	| val |
	val := self given: #shouldProvideValue.
	self assert: val firstElement firstElement = 'bottom primitive'.
	^ val