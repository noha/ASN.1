as yet unclassified
doesNotUnderstand: aMessage
	aMessage selector isUnary
		ifTrue: [ ^ self at: aMessage selector ].
	(aMessage arguments size = 1) ifTrue: [
		^ self at: aMessage selector put: aMessage arguments first ].
	^ super doesNotUnderstand: aMessage 