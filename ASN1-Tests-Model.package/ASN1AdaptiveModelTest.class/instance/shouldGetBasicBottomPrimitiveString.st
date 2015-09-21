as yet unclassified
shouldGetBasicBottomPrimitiveString
	| val |
	val := self given: #shouldProvideValue.
	self assert: (val firstElement basicAt: #firstElement) value = 'bottom primitive'.
	^ val