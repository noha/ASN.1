as yet unclassified
doesNotUnderstand: aMessage
	aMessage selector isUnary
		ifTrue: [ ^ self at: aMessage selector asString asn1Denormalized  ].
	(aMessage arguments size = 1) ifTrue: [
		^ self at: aMessage selector asString asn1Denormalized  put: aMessage arguments first ].
	^ super doesNotUnderstand: aMessage 