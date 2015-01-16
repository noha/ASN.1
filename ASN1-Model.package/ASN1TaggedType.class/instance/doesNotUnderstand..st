accessing
doesNotUnderstand: aMessage
	(type respondsTo: aMessage selector)
		ifTrue: [ ^ aMessage sendTo: type ].
	^ super doesNotUnderstand: aMessage