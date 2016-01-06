as yet unclassified
shouldAddTopPrimitive
	| val |
	val := self given: #shouldCreateValue.
	val secondElement: 'hallo' asByteArray.
	^ val