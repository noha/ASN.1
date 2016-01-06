as yet unclassified
shouldGetBasicBottomPrimitiveString
	| val |
	val := self given: #shouldProvideValue.
	self assert: (val firstElement privAt: #firstElement) contents = 'bottom primitive' asByteArray.
	^ val