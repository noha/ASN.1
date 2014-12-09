as yet unclassified
doesNotUnderstand: aMessage
	(aMessage arguments size = 0) ifTrue: [ 
		^ self 
			at: (self mapKeyForMessage: aMessage) 
			ifAbsent: [ nil ] ].
	(aMessage arguments size = 1) ifTrue: [ 
		^ self 
			at: (self mapKeyForMessage: aMessage) allButLast 
			put: aMessage arguments first  ].
	^ super doesNotUnderstand: aMessage