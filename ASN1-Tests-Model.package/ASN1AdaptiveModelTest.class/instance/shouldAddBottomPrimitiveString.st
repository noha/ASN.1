as yet unclassified
shouldAddBottomPrimitiveString
	| val |
	val := self given: #shouldAddTopPrimitive.
	val beSelfExpanding.
	val firstElement firstElement: 'bottom primitive' asByteArray.
	^ val