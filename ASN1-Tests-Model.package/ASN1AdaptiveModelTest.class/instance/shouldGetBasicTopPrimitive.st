as yet unclassified
shouldGetBasicTopPrimitive
	| val |
	val := self given: #shouldProvideValue.
	self assert: (val privAt: #secondElement) contents = 'hallo' asByteArray.
	^ val