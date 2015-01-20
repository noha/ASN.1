accessing
doesNotUnderstand: aMessage
	[ ^  aMessage sendTo: type ]
		on: Error 
		do: [:err | ].
	^ super doesNotUnderstand: aMessage