as yet unclassified
doesNotUnderstand: aMessage
	| key |
	(aMessage arguments size = 1) ifTrue: [
		key := aMessage selector allButLast asString.
		self halt ]